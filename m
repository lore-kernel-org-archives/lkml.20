Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333229;
	b=UQkT/BamszcX398fzWpJbSC0rhI7q6+QOX/FclcQX3UPXUfXLOfSwQoWMr+rUYT939gu
	 siZiupnKRbzu2CT4Opo4MQGOMeBN+X4y8cE+I3K0XfKb9osWJAzGduSazB2rvjHgZl3WI
	 YnGeFb63bqjKK9akREKVCGzDZYhN+J3JCfaXKp3qyunvkGj4M3z/D1/A1lM1kZDM1wRe7
	 RyAIYmIv3k/FxW0lY9BCayOxx+M6/qGds0kJeAxKVOfvqgdMMoRhAlPaDNLuzXc1ggnnP
	 09uDTeqtqmpwfBqD6z0R8aQKARhmvf3hUAuYWb6IvrUrxUrZ0BpJLZZvq2iP+zJiv1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=S/qZucqkzx7qvX/YIWrg59XYaPpYXxILWqLaRuMZDDE=;
	b=Q4u0DvCyFjQcu1kPC6YMzGrwbbYUZcomuaQ3mnlS3OHPwtKDg9mZGbgNqLPEcRs2iGPQ
	 RL/AHdeyB4w1lSMQgWLn5s9QzG2qXqMlC7WAsXJmnfUEQjK0E0MNeU2m9HzvhoeNp4g6I
	 QfjnzeIqTsBJ6CETa/n2EM8DGgLfEXGBzlH0nhGVTF0TjGOROgEOEb8xPaP2Yg6XtP+6X
	 b1Xiue5vri1x2tGd+9lI+/jPB3SYFpAzcMMHH//oxOhXOTHPUPR4BzlkOjKhffBi/Llze
	 g0haAVS6I8WSOx4UWtb1gm1X8ir925pOQZZiK4j6kOJXclPMpoc0YrMHxZ0zcB4LjMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=F81bdru5;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8968D606A206
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8968D606A206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=F81bdru5
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so131119c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1794333225; x=1794938025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S/qZucqkzx7qvX/YIWrg59XYaPpYXxILWqLaRuMZDDE=;
        b=F81bdru5i5Uk13C1W73IUc5oYBUw0hva8q/A6WiRDjjevSNUfVxTfTWiD/EqXTe2Q/
         5px8Y88dTNUdrMIoSIdtvjWBC13tcpNh2ejssns0Xjsj1sBkHUZrIGQYIeP5h8mCTn7e
         cbjtwDFH1ql7TwTE/5AQ//Sq6V+4Q09CSI5EM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333225; x=1794938025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S/qZucqkzx7qvX/YIWrg59XYaPpYXxILWqLaRuMZDDE=;
        b=Vb+Y2ICRsDdkXw4BBllGarCWsiGkIDNr6wf41fZ4hqpIMHhMUy442umwyCKVS6vdAZ
         Y4dz/yCPyYG9AV+kCJnOjGzjGIXGBhP8qFOEW+Gqsf4d7V6wqR8fZnbEneT+1yDPT7sF
         GNxNondeHi28lM0zIpVWyKFBuKhFPHtzfd0YBmFmrj1Kn1KbBeYHoEIEvPat7KoFTe1g
         NNm3bExcxpiI8h41j7ov3WGk5e/EVXjUkOE2xpvxz/TQgDzwQdabzX5fPDVqSfqsHmgu
         Qle9OFrjOrybIx/6WI8Vrq8/tYsVTmQGVfMLKvbEnYLpKKIWtRVDW8Akg7bpmF8axP/U
         K+bQ==
X-Forwarded-Encrypted: i=1; AL+hErFZ4A+N/nx40tTNjp3F51XR7aFbt2k9UMAn9nfawnvz9s1NrV1FnoBvcc/sjaEVdjS2D1LSvZ/ZHis9LaU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gsfUy3AW2hdQlXXdT6of/Mvgp+/zONruAtNTV/K4DSqWUMDKe
	eIOzsp21ytPpny4VJYrWaQx9BUskrB23xKG7DFhmxTqRc+CdMHrU664tWYAYpXQov2c=
X-Gm-Gg: AYBFou2rz51zwme+mNQ14MdRQnusx64OGrwDdr/ZS98s8LPqVgFSQred3O1CYBcdlRB
	DX1tK9ZPIL166y7cJbrWVpdV7rurX0yjagakAwanoLqSQ+fYMCXpp3s4GdWKYO3SaJijqWeHE7u
	69AmRBmQpQTDCNbKtflW/k2X4vzMv6Hs/u1+tsPiwrzljgbFK0cbVh4+kFlDildSTixuaRtp+CD
	8Hs9hbxfiL5BGHdQkBHIn2dU9ZdGsozZ23K5RhFjNmn/lvj4aS/E9eRXYGi1+3pZz3Gyuplvl1R
	prVWOHnBFYcA2q+f3uZxGWd0Q83gsmgQIDVYwKv+yqsQI98g5ekfFUZx3sjwtArOTrGIsR2GcRD
	6M68flPiszpX5zjLrxghRFEYsBkteblLQ+w/iRIdlnIf5BlKnHHlYuAXCsjK3rZ05rwM0/BH+4U
	/DXbwcXtfbJCVcDOjkDFwlJWwdQHX2rnOe/m++weYFE4zwJ/qaxxq7e7YUhPHbnKo/swMPCLz3Z
	o5bw0q0pFl23nZ+Ctg7ZqQzswCjwCZj9MOTSv+dD5Gu1PDmcle/p0IaPbMhVfHE+0os00pojISs
	ty/LcEIUr7p/u0eJ0gXt+miHxszDf68vhLuL2ZVszLAKJ9787yU2VoHvEJ4WXf4F0mO19FIGscx
	Sf5q9D44elTHWcJYHbSbPJsJ9E6QofAzxnAdSJ+98WmDJAGGjKhJnMBEqlGw5ijUn
X-Received: by 2002:a05:7022:ea8b:b0:143:8860:afa1 with SMTP id a92af1059eb24-1b3b619fde1mr4282234c88.46.1794333225326;
        Tue, 10 Nov 2026 09:53:45 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11150sm11875452c88.5.2026.11.10.09.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:53:44 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>,
	Piyus Kedia <piyus@iiitd.ac.in>
Subject: [PATCH v2 0/1] Bluetooth: fix stack OOB write in the legacy adv data path
Date: Tue, 10 Nov 2026 23:23:33 +0530
Message-Id: <20261110175334.676816-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
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

Hi,

We would like to follow up on the stack out-of-bounds writes in
eir_create_adv_data() and eir_create_scan_rsp() we reported earlier.

The patch we suggested earlier bounded the copy in eir.c. As Luiz pointed
out, the stale advertising instance is the bug rather than the missing
bounds check, so this new patch unregisters instances that no longer fit
the controller's capability, at power-on, and reports them with
MGMT_EV_ADVERTISING_REMOVED. Userspace can add them again with the right
size.

Verified at runtime: with this patch applied, the reproducer completes
cleanly on both the adv_data and scan_rsp paths and the instance is
removed; without it KASAN reports a 220-byte write into the 31-byte
buffer at eir.c:303 and eir.c:360. The tree it was verified on has
net/bluetooth/eir.c and hci_powered_update_adv_sync() byte-identical to
this base.

Apologies for the form of our earlier submission: it was a bug report
that patchwork picked up as a patch, which is why the whole report ended
up as the commit message.

Link to v1: https://patchwork.kernel.org/series/1206772/

Thanks and regards,
Piyus Kedia
Kapil Vaswani

Piyus Kedia (1):
  Bluetooth: hci_sync: drop adv instances the controller cannot carry

 net/bluetooth/hci_sync.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

-- 
2.34.1

