Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792441015;
	b=pL6ETDYXPJYdsxyUzaoJb1FQe5TdcPNLEzKneXeWWOhiQwwH4Ykd1gsfKwbcbU+D2Fce
	 batpZta6WAMLXTjyIqHv5TXu4GpNe3cucTb4adYZCVqR+/eTB2X7jk6CPpf0IVXQZxbgQ
	 5+1Jwzey5vl110BRbg99n7SYYm1aVFLF7mtkxjazUoshT5nOqN60W8ixy6CTfugsWOcKg
	 YoYaj7Zd9bRIgpyFVu97uKBBLVM5CYdDyh4Pb219VB4Pnts+ic99yvsRQoynCSG4mXHkw
	 J5UeW7uw7KwHPCCA0beyXSLXDJUvbRJwkSM331VwreexhqV1Z9CNhHSyxvPuZMsWcMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792441015;
	h=DMARC-Filter:DKIM-Signature:X-MC-Rep:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:MIME-Version:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Disposition;
	bh=T8NDS9TBcsxfGLpdye5MNhtdRD4fWL/RdION8FfvRn8=;
	b=J6f4Cm/EMpu9XCeb7UOn4/5vNxUgtysnuDSqiPrdCiwpVJBfDn1776xHGg0n12Mqp1Jk
	 GxHapcwIU6SOaENTsxR0gXjB1dRe+/FqKhKWUHPTR0dfFV3HlDMWIyu1Sw19AgHySoyFe
	 5yQADU09bltERHExjblbhQ0EE1wOjQM/7o9FNbm8GAnDxVVkex7/Ru6quzxPZXsS/IWRj
	 qlQgimSPg6Dr/NLXCuTjWYn2ReDI40nAiq3+R9U3OBu+EHMePMXrvR+/YACuQs5UdG2a+
	 xqBRfSfngnEIOVLOTbJdYV1v8Mj+IfVYEaXrsPDNLbeiIHNu6XTL4nXyz9oTdahHN2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=COTdvS81;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527F2606A324
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 527F2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=COTdvS81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792441013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=T8NDS9TBcsxfGLpdye5MNhtdRD4fWL/RdION8FfvRn8=;
	b=COTdvS81OX7XvlT5CjxDOoDtactMK6R8tu4OqxxYA/KJQXhxehwbfEOU4GD3lQScCJoc4q
	zU8MsfLyekHazC7ODC5CWG0CG33lX1O8WTbeP0DDBZSbM9HgxSRzphiOKau7euFIF8hZCz
	h2ogwe9IHvVlFhEZsM72VsoVwwmuYUI=
X-MC-Rep: binary re single
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-OzxXD9FbP76TFuEZSZfsQQ-1; Mon, 19 Oct 2026 16:16:51 -0400
X-MC-Unique: OzxXD9FbP76TFuEZSZfsQQ-1
X-Mimecast-MFC-AGG-ID: OzxXD9FbP76TFuEZSZfsQQ_1792441011
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b0d9789e84so30907897b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792441011; x=1793045811;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T8NDS9TBcsxfGLpdye5MNhtdRD4fWL/RdION8FfvRn8=;
        b=hwNzUOKdFAbgR0xwmi0EYGLqKejGZ69xu+sUXjmHthWVFbpdDaF7ipUbTET0Bxccja
         LNS6UOwIousbBe2qe3oa5S5i64Ac3dCvMkCw9W6Jds099OZDfBgXvM6RJvAf6N4JmJsd
         f3gT7Sts3D6CgrIa0esXZEXB55+ytUhd0skKfIL/rRcTHHn/V4AW5oa0HqXlYZAV1E9r
         HFy5TaxHaFY5HngmCgqIEzn8QqiFAo5gmXAEYEHlwEXI1N3I2AJ/23Twz20cnyhcfOKc
         MKpLw+ooRpHAbkXKwTPhUJy9M/WT6OdoXUBqwnacTzHRRPVLL1BTyPbM4U4lgMGSWa8j
         +AGQ==
X-Gm-Message-State: AFq9FYKW2Y1fJlssnywN6gqyPvjPmDw1/uEPlgAWKRrWo77stqi2TL9t
	Zq/xc2RXU+GTllI53gxL5ckG4EMD/EI0j28CMd++5mwnlhsYck9J9x88HjhXaZa5Zkb323VazNO
	jQXMGkO6bPygMXW2fzmMsoYKqD8BSr6HHcgwpKDqq8o2JATnx1nPR1ypuZItaP40I0w==
X-Gm-Gg: AYBFou0tl28ZwX0+6Gao+Y2FQocSAXaYd5m+ko2erW4RhVLjKy1aeWBehgoncXjZO0d
	dPfifUCf+5Xuro0LhGnmbepID6U3eSBeYv3kzbVztnz6qgZB0j710lQZ8mhjLP8ULuergDSBPnj
	r7cp63ykHlkfBQRwCAIGFfrN9TB+r+7kYeiWSOwCnZCdvdpino1HEJMRL6ZmVZxM1lADwz3U2js
	eS3Q7Br3oW+BeshJxoBFuaK4IbUgEap/ecvAjeaigOGe+Ymq4xnmX/322YePxNMXvgNt9ZWrHlG
	ca1mY0hZvEM3gKFayLGgG5f8+lVNIcMCZJAaPQXfwFZc9PpISvLzImA+SOoVWoRD5bsDpfZMcib
	rf4EAGB/td+tJm/N8GoopFw==
X-Received: by 2002:a05:690c:6509:b0:8ab:a473:fde8 with SMTP id 00721157ae682-8b0f21c879amr30941857b3.54.1792441010788;
        Mon, 19 Oct 2026 13:16:50 -0700 (PDT)
X-Received: by 2002:a05:690c:6509:b0:8ab:a473:fde8 with SMTP id 00721157ae682-8b0f21c879amr30941787b3.54.1792441010100;
        Mon, 19 Oct 2026 13:16:50 -0700 (PDT)
Received: from localhost ([2600:1701:430:16b0:65aa:a2f5:8fab:cae6])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b11b3f49d5sm4874647b3.0.2026.10.19.13.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:16:49 -0700 (PDT)
Date: Mon, 19 Oct 2026 15:16:48 -0500
From: David Teigland <teigland@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, gfs2@lists.linux.dev
Subject: [GIT PULL] dlm updates for 7.4
Message-ID: <atZ6sKjlr3SxThCU@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Mimecast-MFC-PROC-ID: 1nKqP3ccqLjcOLbM04_Qz7Ip8aHjOzpTE8hKVS1NNCM_1792441011
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull dlm updates from tag:

git://git.kernel.org/pub/scm/linux/kernel/git/teigland/linux-dlm.git dlm-7.4

This set contains several fixes for bugs found by static analysis,
fuzzing and code review. They mostly involve invalid input, e.g. from
userspace, configfs or remote nodes, and are unlikely to be seen in
normal usage.

Thanks,
Dave


Alexander Aring (1):
      dlm: fix variable key length lookup

Dan Carpenter (1):
      dlm: clean up a type in waiters_read()

Danila Chernetsov (2):
      dlm: validate lock modes in recovery messages
      dlm: fix NULL pointer dereference in dlm_dump_rsb_name()

Haofeng Li (2):
      dlm: gate dlm_plock device on CAP_SYS_ADMIN
      dlm: require CAP_SYS_ADMIN for dlm-monitor device

Hemanth Selam (1):
      dlm: fix typos in comments

Joseph Qi (1):
      dlm: fix buffer overflow from negative len in dlm_search_rsb_tree

Qing Ming (1):
      dlm: validate node weights before building member array

Samuel Moelius (1):
      dlm: validate userspace lock resource name length

Zqiang (1):
      dlm: wait for outstanding SRCU callbacks to complete in exit paths


 fs/dlm/ast.c          |  2 +-
 fs/dlm/config.c       | 39 ++++++++++++++++++++++++++++++++++++---
 fs/dlm/debug_fs.c     |  3 ++-
 fs/dlm/dlm_internal.h |  5 +++++
 fs/dlm/lock.c         | 20 ++++++++++++++------
 fs/dlm/lock.h         |  4 ++--
 fs/dlm/lowcomms.c     |  1 +
 fs/dlm/member.c       | 17 +++++++++++------
 fs/dlm/midcomms.c     |  1 +
 fs/dlm/plock.c        | 14 +++++++++++++-
 fs/dlm/user.c         | 23 +++++++++++++++++++++++
 11 files changed, 109 insertions(+), 20 deletions(-)

