Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538167;
	b=T/VUqFNL9rWQHKU2BFPOsZCtYz5gxD3ej60iH2FNTtvVugCLjmosOedrjpmuyGFN5RUi
	 yEhQfPG4ChaPDO9WsvIWRKr0FX9Zgw8ZsXIbLeZ/c1chjIpJTq/SRrMbXzgsA2iSR6RYg
	 vEhhgXEQO6lM7ZnyVT0jeoDQ5+zWtYQFjvKHonJi1E5mzhnUHS/f1ycil/2Hkf/ACm3UO
	 BHhgVttGVM1uNvX7r9MghTzIBG7WcUTOnR0SWqKJ60pv5fccJOnELAAt0BmVIUjuqxcCA
	 K1NsUHLDj4Dix4cI7d+cDz1JFNLWBLYLJVCXlYc35yC7KG0DM7T9pz0Yi9fwl0Ocjeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Ea7AxrGlB7THjQmdukSzo51aXDomAu6+9ySrKXHX0Qw=;
	b=jJJUwDEivK9WU9Y5/qACQaDprE4HxtAj8OGc8BGbTYVGse0zm/ccG6qnaXSfcY5CQ4Ga
	 EsPfQYE2eFcTxeidL9G3o6+qLo/wlFGufmDnP7i/V4E6c7V0ewEby22PQuiyd8PiCkKu9
	 cFVF9yYDd+q3XKGwDmzNMwp/vuVeqnfSxS9XPJymJTPiiuhE44uQrWqTImqsITttc1FBt
	 5RODWywN57DVa+Cbmzm096jxOfQ/WIUelY94uH7M50+ZzTPWuS4wSchB5ZunNYckGJZ/S
	 fbQY9m1J1n9P75VWLXeXlDfRWN4if3HxCWPDGYTYuBhiiWngHMyvdgZKBxZjYGXqBBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sarthakkukreti.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jXuN50+C;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2423606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:49:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2423606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sarthakkukreti.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jXuN50+C
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36d1353fdcdso2266500eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794538166; x=1795142966; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ea7AxrGlB7THjQmdukSzo51aXDomAu6+9ySrKXHX0Qw=;
        b=jXuN50+C855ba25WGA7GSVrXfMxVhkFtQLaazvbUEGmLcdy4Bt0H/mu2g3XehK99l5
         6N88eC+yDLGx076KS8oedkB9G3gNDNtibWw/9GVMvpJ1sxcperHn67rLky4govSaqSmY
         QKLvmrigziC4+QAc1chb4ZMq0D6KP968s2xd86isE95KAYioHC1djE9SVDyOF65aXFf6
         XTCpx9ToMpy6moZa0jv/61YyIRfsJ5LSD2SGlCSow5eWX8iHdFnjjQOHbNVRWRs8yowc
         hHXjn7N3poiIZojQIGVh8MSEFo8aj8P3CCLNkGXWzt0wHLTkCK6KgGDuuBJ0JDM6buX3
         JUxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538166; x=1795142966;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ea7AxrGlB7THjQmdukSzo51aXDomAu6+9ySrKXHX0Qw=;
        b=ePkk9cRE3txRx9AGrgSdz3hkH56KE6w82SOu81g5IKMZkOwKwASWxErxjvAoBjSFj6
         5ZQdebxIB4eGPaybccR430SMlGccIqPlEcyJjbZMMkf6Yl2cZQH1MKJFK2RWac2PZSt7
         wtFD8zltuhstVhpJvqAge3/7QvSzNeyipBaV7ZN1pmnA22GP2/f18Eu9NO0OuOzt6NmB
         nOvP6x8VrChS/rTyr1cvB4CzfMunbVbQtaVshcqtFBu7q+168JDukKDJMEOHA+vnsD66
         Whod4AK8Z6rFB4sWHTNs9KncYAgxYwbg5pZcnFTDDBaesrKP5nIhrUwXJ1J68Fr7Rjo1
         9qVw==
X-Forwarded-Encrypted: i=1; AL+hErHtvkMhIkVuc2ukeW1cBokB1fR3s22YQreGcYmwTrtO0lCOm+9+62SNiIxozFE7AzF+loX+YTBKVPCOKpU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eqoTZiqbjQcruRgH2kDhrosXDzC2taJVzFpD5aO4/X1Br3ZjA
	qd8WGJYXy0s1upj/0DTovxG1jwZ+LhKwkriC5kR2GnejvXGFkk+MnowSllN+LSPfKud1svjZcOS
	TS0KgcTbv17yYsc9BCswEqGYW5mLlVcIRLY4FlQ==
X-Received: from dybme13.prod.google.com ([2002:a05:7301:188d:b0:36b:c499:531f])
 (user=sarthakkukreti job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:c7c3:b0:376:972f:afa9 with SMTP id 5a478bee46e88-37966387a09mr993929eec.9.1794538165337;
 Thu, 12 Nov 2026 18:49:25 -0800 (PST)
Date: Thu, 12 Nov 2026 18:49:18 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261113024922.27977-1-sarthakkukreti@google.com>
Subject: [PATCH v2 0/3] usb: uas / scsi: fail inflight and queued commands on
 dead links
From: Sarthak Kukreti <sarthakkukreti@google.com>
To: Oliver Neukum <oneukum@suse.com>, Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K . Petersen" <mkp@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sarthak Kukreti <sarthakkukreti@google.com>
Content-Type: text/plain; charset="UTF-8"

Unplugging a UAS device during system suspend after hub_wq is frozen
defers usb_disconnect() until hub_wq thaws. When sd_suspend_system()
issues SYNCHRONIZE_CACHE to the disconnected target:

1. If the HCD accepts the URBs, the status URB fails in uas_stat_cmplt()
   without completing the command, stranding SYNCHRONIZE_CACHE for the
   60s SCSI timeout and triggering the 25s DPM watchdog. Patch 1 tracks
   the active sense_urb per command and completes the owning command in
   uas_stat_cmplt() on status URB failure while unlinking any inflight
   data URBs.
2. If usb_submit_urb() fails with -ESHUTDOWN, -ENOENT, or -EHOSTUNREACH,
   uas_queuecommand_lck() requeues the command instead of failing it,
   and leaks unsubmitted URBs or orphans already-submitted URBs on
   partial submission failure. Patch 2 fails the command with
   DID_NO_CONNECT, frees unsubmitted URBs, and unlinks any submitted
   status or data URBs.
3. When the command completes with DID_NO_CONNECT,
   scsi_check_passthrough() matches SCMD_FAILURE_RESULT_ANY and retries
   it against the disconnected target. Patch 3 skips retries on
   DID_NO_CONNECT, DID_BAD_TARGET, and DID_TRANSPORT_FAILFAST.

Tested using a USB/IP (vhci_hcd) UAS target emulator that freezes
hub_wq, injects -EPROTO on the status URB during inflight
SYNCHRONIZE_CACHE and READ(10) commands, and verifies immediate
completion without DPM watchdog timeouts, along with the scsi_lib KUnit
test suite.

Changes in v2:
- Track sense_urb in uas_cmd_info and complete only the command owning
  the failed status URB in uas_stat_cmplt() instead of looping across
  all devinfo->cmnd[] slots and orphaning other commands' sense URBs.
- Set DID_NO_CONNECT only on -ENODEV and -ESHUTDOWN in uas_stat_cmplt()
  and uas_data_cmplt(), and DID_ERROR on other status/data URB errors.
- Clear pending submit and work flags and free unsubmitted URBs when
  completing commands on status URB or partial submission failure.
- Unlink already-submitted status and data URBs in
  uas_queuecommand_lck() when a later URB submission fails, and remove
  the unused out label.
- Add Fixes tags to all three patches.

v1:
  https://lore.kernel.org/r/20261113003536.3622755-1-sarthakkukreti@google.com

Sarthak Kukreti (3):
  usb: uas: complete command on status URB error
  usb: uas: fail command submission on fatal USB errors
  scsi: core: do not retry passthrough requests on disconnected targets

 drivers/scsi/scsi_lib.c      |   5 ++
 drivers/scsi/scsi_lib_test.c |   9 ++-
 drivers/usb/storage/uas.c    | 128 +++++++++++++++++++++++++++++------
 3 files changed, 122 insertions(+), 20 deletions(-)

-- 
2.56.0.611.g1030f0b940-goog

