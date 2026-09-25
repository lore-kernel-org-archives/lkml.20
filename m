Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABE74DE705
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790363748; cv=none; b=lFUDeeQe2vErVHF7bBtNVrWJwQPtgVI+WgKIxGVpKP3IF7kpKU6XSXyZ9FhuRoYaK4gAopnFJR5pp+ylLFATkjKgpK2u68dg6F85DwqouyrpWQI/4p2MwnVxNE9Sjm9gGpW+86w5/OCRbBRmiVqrZw5T9/I+Tx3aycdfXqVf3a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790363748; c=relaxed/simple;
	bh=NiPUZi6Al5uPRmMXb22Y9rxVsPEB+1bQ/8NzIbSQR+E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XO2ie3u5AtiUHcxi2QDA1XLFpuwd+07af8f8BM9gQlUVP3XxXzF0AElHjoIJFDeIVF8FZZN83hlmgGStrp7I8h4UFtmq8ZO8fotmHPNHh4F6EVLGqnRxfiedCFMNen4cMGrQCJkLxQymjsidBjD/hQk+SMg2y76EZ4chLxtqVpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=icZ422X0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="icZ422X0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790363740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VFihAIrqz+RYvkszD3bVjyhkeNcRuMjw3/hfFNwWt6o=;
	b=icZ422X0vyyqcuv4BWvvLdiUc5r0ibSrW2xfUV9zS5emuntSIR6XRz+pNxgNWIMzplo0SJ
	ljwewGEyGFC+CF3inq4dVd4F/hKbNh05UcC0IeAR0pj+SU6MXvigf0VKIArsDorlsQa6UJ
	WgPTPqS6QcAm+z34rlTcI9oZ5EfWsx4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-169-Bz9o_3_LO1CDrR83TB3NMA-1; Fri,
 25 Sep 2026 15:15:36 -0400
X-MC-Unique: Bz9o_3_LO1CDrR83TB3NMA-1
X-Mimecast-MFC-AGG-ID: Bz9o_3_LO1CDrR83TB3NMA_1790363735
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3026C18005AC;
	Fri, 25 Sep 2026 19:15:35 +0000 (UTC)
Received: from warthog.com (unknown [10.44.32.54])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9B6931956042;
	Fri, 25 Sep 2026 19:15:31 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Cc: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-afs@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 0/2] rxrpc: RACK-TLP fixes
Date: Fri, 25 Sep 2026 20:15:17 +0100
Message-ID: <20260925191520.2206700-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Here are some fixes for AF_RXRPC's RACK-TLP implementation.  It's split
into two patches: the first just fixes the RFC number in comments but has
no actual code changes; the second does the actual fixing, including:

 - Making the in/exiting fast/RTO recovery flags available to RACK-TLP code
   after the Reorder timer expires.

 - Arming the RTO timer if no other timer is running and there is unacked
   data.

 - Initialising the TLP state in the correct place.

 - Not resetting the xmit timestamp when marking a packet lost.

 - Correctly checking the flight size.

 - Correctly tracking the number of packets in the Tx window that have been
   re-sent and thus correctly estimating the flight size.

David

The patches can be found here also:

	http://git.kernel.org/cgit/linux/kernel/git/dhowells/linux-fs.git/log/?h=rxrpc-fixes-2

David Howells (2):
  rxrpc: Fix the comments saying RFC8958 to be RFC8985
  rxrpc: Fix RACK-TLP implementation

 net/rxrpc/ar-internal.h |  6 +++---
 net/rxrpc/call_event.c  | 13 +++++++++++++
 net/rxrpc/input.c       | 10 ++++++----
 net/rxrpc/input_rack.c  | 28 ++++++++++++++--------------
 net/rxrpc/output.c      |  4 ++--
 5 files changed, 38 insertions(+), 23 deletions(-)

