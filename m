Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F754734E4
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787838211; cv=none; b=jekSkhuYPtloG+LoL8LvmWQn8VITBbe/hwuI0G1DSR0sIdojWvb4LU2BKMK+DKmXAzvcd8gYkBYbMwvv7YTllBFQXiX42eFxf6xNEIbl+RykAC2BtIJn14auGrHSKP2upc6vmSC07t3uJJGj7u3rluo0KlpH+RWbwfBGmEv0Ezo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787838211; c=relaxed/simple;
	bh=IizGxEfTjfhZJVkwhDscGC2P/a5HlqU4Kr8qrccX6z4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qoyU1UAXMchHLjf8tqlunsxkx+ssKSalv5QQZX5i1IsjUpd9lZOoWPOLMF9GRgefBi/2JX7qAXLIFM7Ppy+/xTiiz5/uWuRZZvXaPaSlakqs6a/TY2l5Jb8cYOJTGIN4MQsKQpwExMXPs0NeN9V3Cw+U+xqAi9IUeTvaorRPIxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wq+9OnDY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wq+9OnDY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787838207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bPPEzvtBLG/nC8I1Bmob/2jRQbbQ9nOnJ6K+0h7yLO8=;
	b=Wq+9OnDYlT8JHY+VCzlJOek68euChJ/bLi0tjaOY0Adl2cx7BrQyPoKnnSg2iYdOUT//mb
	SsnQkRB0Vb+xQm2W012wAc83+wS9MU/qICibto09bJd+SYF5xA3qPqFCNaXFZJ4wkDen+Y
	NdXhPasu1yC2LVijx6MRtx9jwjpkgUo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-657-XRizu61CPsuLjMwlmWSQMA-1; Thu,
 27 Aug 2026 09:43:25 -0400
X-MC-Unique: XRizu61CPsuLjMwlmWSQMA-1
X-Mimecast-MFC-AGG-ID: XRizu61CPsuLjMwlmWSQMA_1787838204
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5C8A41862D74;
	Thu, 27 Aug 2026 13:43:23 +0000 (UTC)
Received: from warthog.com (unknown [10.22.88.47])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 42F131955F70;
	Thu, 27 Aug 2026 13:43:21 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Christian Brauner <christian@brauner.io>
Cc: David Howells <dhowells@redhat.com>,
	Paulo Alcantara <pc@manguebit.org>,
	netfs@lists.linux.dev,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 03/10] netfs: Fix error vs transferred passed to ->ki_complete()
Date: Thu, 27 Aug 2026 14:42:56 +0100
Message-ID: <20260827134304.2075713-4-dhowells@redhat.com>
In-Reply-To: <20260827134304.2075713-1-dhowells@redhat.com>
References: <20260827134304.2075713-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Fix netfs_unbuffered_write_done() to pass the amount written to
->ki_complete() rather than the error in the event of a partially complete
transfer.

Fixes: a0b4c7a49137e ("netfs: Fix unbuffered/DIO writes to dispatch subrequests in strict sequence")
Link: https://sashiko.dev/#/patchset/20260824120224.504575-1-dhowells%40redhat.com
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Paulo Alcantara <pc@manguebit.org>
cc: netfs@lists.linux.dev
cc: linux-fsdevel@vger.kernel.org
---
 fs/netfs/direct_write.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/netfs/direct_write.c b/fs/netfs/direct_write.c
index 544a4243fc59..f7d7e1b54653 100644
--- a/fs/netfs/direct_write.c
+++ b/fs/netfs/direct_write.c
@@ -51,7 +51,7 @@ static void netfs_unbuffered_write_done(struct netfs_io_request *wreq)
 		wreq->iocb->ki_pos += written;
 		if (wreq->iocb->ki_complete) {
 			trace_netfs_rreq(wreq, netfs_rreq_trace_ki_complete);
-			wreq->iocb->ki_complete(wreq->iocb, wreq->error ?: written);
+			wreq->iocb->ki_complete(wreq->iocb, written ?: wreq->error);
 		}
 		wreq->iocb = VFS_PTR_POISON;
 	}

