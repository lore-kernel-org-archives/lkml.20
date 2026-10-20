Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792527195;
	b=bqC49SYjmeT2OxZzZux0vKP9B0HUj+F+NQ+R4YWx8thnJfj7n6NRy9GoUNm8P4GmDslK
	 0CYgFSBank09j2G9qA2DTv4/utQ3HgyGEyDaC23/J7rpLuIzzr9Vy3+cGw2sh5YhMtg2Z
	 6ETsGY0DeqinKU2t1A2G6OTEV1AV+8giSrDvI9XG2Vpvceg6ujFWwjiwPkomZL/5Mu0r6
	 +gNY+27Ih+yWd1NeY5PNYZZ8uDOAzGT9JpQotVU1XS3YTkzx522C3/A2m/YP7yI+8Z7YU
	 DeGIKuYxedZeCi+cfyzmLiJKqhMxK+53PTIoJcg95stA80m442eWD2gQ8cNyEXPnI2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792527195;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=Oah3iaTrovgfL9AhWMbpu28y1JJA5jwM7jXNU1H/0Iw=;
	b=TqpEKfG+C9D3o2VjJZGCIYfrsLfyeFnZrNlJ9HqGbtIWR5jVi0QnaeSgrl3ipb2J2hBo
	 9QevI0CeQDgEShwMb1HvTUWuewkVbVCBC8Iq/HPY8+uQtt/ZDZH3HorNxH0vdYfmWEBuB
	 esHpRoc5NnhDHfhNueCGIkZVJiuonXpthhWUtGKmWYXlhaUzmHKfoSVidO7+bXL83fC+y
	 3+sHOOuGEfqkhOqr1PZLF/WKDK90gyLkdx+LKJHO3HBJzpEOjmJf4GGGzBaROwUdBoea0
	 iEoM+4vWp7fR5FtqQa3OyfCHCWgH1f8CIpz+Qi8qS4re1GGKlCdnAZTMMi+6ZoZysYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EOmT92ot;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EFD606A327
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90EFD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EOmT92ot
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792527193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Oah3iaTrovgfL9AhWMbpu28y1JJA5jwM7jXNU1H/0Iw=;
	b=EOmT92otkpGb/LozScsIHJAHHHjhC4n7t+ciU+D9FV2jykkX2Ey+Mq8fXIMTIlLuWYgZFM
	U5R43nx1GbGxVzSNujD/VUs6lfNikXXb9U+TCkiJ50cuoNHF6OVnExXrjMXmp1vZPj0qhu
	XXo2UcOZvKlXzSl3KkQqYotkWEzbzFU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-19-JJguI9unOi-Q7vdkgp_c0Q-1; Tue,
 20 Oct 2026 16:13:10 -0400
X-MC-Unique: JJguI9unOi-Q7vdkgp_c0Q-1
X-Mimecast-MFC-AGG-ID: JJguI9unOi-Q7vdkgp_c0Q_1792527188
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EF03E1954185;
	Tue, 20 Oct 2026 20:13:07 +0000 (UTC)
Received: from warthog.com (unknown [10.44.48.29])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C8027195608B;
	Tue, 20 Oct 2026 20:13:03 +0000 (UTC)
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
Subject: [PATCH net v2 0/3] rxrpc: RACK-TLP fixes
Date: Tue, 20 Oct 2026 21:12:51 +0100
Message-ID: <20261020201258.290827-1-dhowells@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Here are some fixes for AF_RXRPC's RACK-TLP implementation.  It's split
into three patches: the first just fixes the RFC number in comments but has
no actual code changes; the second introduces a new way to count in-flight
packets; the third does the actual fixing, including:

 - Making the "in fast/RTO recovery" flag available to RACK-TLP code after
   the Reorder timer expires.

 - Arming the RTO timer if no other timer is running and there is unacked
   data.

 - Initialising the TLP state in the correct place.

 - Not resetting the xmit timestamp when marking a packet lost.

 - Correctly checking the flight size.

David

The patches can be found here also:

	http://git.kernel.org/cgit/linux/kernel/git/dhowells/linux-fs.git/log/?h=rxrpc-fixes-2

Changes
=======
ver #2)
- Rebased on latest net-next/main.
- Fixed Sashiko-reported bugs[1]:
  - When performing TLP_send_probe() [rfc8985 7.3], don't do backoff.  Note
    that backoff may already have been done by rxrpc_resend().
  - In rxrpc_tlp_calc_pto(), clamp call->peer->pmtud_jumbo to be at least
    1.
  - Added a patch to replace the way in which the number of in-flight
    packets is tracked to avoid estimating using values which aren't all
    updated at the same time.

[1] https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260925191520.2206700-1-dhowells%40redhat.com

David Howells (3):
  rxrpc: Fix the comments saying RFC8958 to be RFC8985
  rxrpc: Fix counting of in-flight transmitted packets
  rxrpc: Fix RACK-TLP implementation

 include/trace/events/rxrpc.h | 11 ++++-----
 net/rxrpc/ar-internal.h      | 22 ++++--------------
 net/rxrpc/call_event.c       | 13 +++++++++++
 net/rxrpc/input.c            | 15 ++++++------
 net/rxrpc/input_rack.c       | 45 +++++++++++++++++++-----------------
 net/rxrpc/output.c           |  5 ++--
 6 files changed, 56 insertions(+), 55 deletions(-)

