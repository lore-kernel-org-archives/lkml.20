Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A493C1A
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 01:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791335904; cv=pass; b=emvi5toNNsyE5/XSHvSaMdOdlOBvV2Kbz/LjsnV/WdOQLHAkVxbiWmPBxP2cgfZf8KOpTxwLKj6EEnA/RBdSI8wjYceDW/P3FWf7PozwgqN6PfrRTvryGONYCWKzdVw6mAWRhVujScs2FQOFtLxqloOh0RC9V6JbhNL113TsocM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791335904; c=relaxed/simple;
	bh=pZUZVw/r7QKqfHaSqiu3U/sawF5KkSgPe+LInuVqhTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c0hNnkjEHmoAEr7EhtpwzfRfw34RrOvk3KGje7of4B63prOSkfqzubjpoZh8Z4vyX/7vwpUwZKicqg2g24FhpBNde1/Ve9gf7Q9Id8b4OJvjXPi8CxHSUjTtpn8tKaP1X3XIkkFK0cLhJMDv6ugdwGTD/MaULFBUbOEDxfipKz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BKyyReCS; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BKyyReCS"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67583c777abso1743149d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 18:18:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791335902; cv=none;
        d=google.com; s=arc-20260327;
        b=hWSMq5d7bUKrncB43f99wV/sq8CcyTYWPlsIWf+IQKZYlhgB92WAx9ACkrSynhALOB
         LAFmNsT/N1zH1mPW1nFRLCNxdNuZio5HhzeBnXRkrl0x04xEEIjSBki2+ijnZdVoYply
         MbK/fjZycju0oz8tuY0DVCcpwsFaD1dNfDb+TnqiKOHYZ5LNh/yS8puLfOpQInbvHnpT
         hNxXRzwV50U3CO0w0BuL70HVbu/H3/SsQIAuN0Il2/YjCuE0jMf4xOoUYlPWB7/rwd9M
         Umqcz3v7bJmk/Zncuz8xEKBoklyXN1pv8FGk3Wi9a8YwX2KDoQ0CAlgSuMbd8pv4hXze
         GRfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pZUZVw/r7QKqfHaSqiu3U/sawF5KkSgPe+LInuVqhTs=;
        fh=9hZgKDeGrO6vavkkfvr7kP/oaeikJ3HPhwaVrdxj6Bk=;
        b=AV0TPSvD8E2faQvvtlc+rNK9zJw+inQ0dt+ljdqhQ65mnZ3I1IP2XM6HSUBDTT59X2
         /BN5a7py1ZfKRCtq3NsAh7ZOFuMtNhzLbPee92PWmhPczFEvUZakuDqgvha1W3VLmdX3
         yPoAV73avalfpkR7AAS9TRadKS6Kmi9Q8yfH11DOhjhSamQXKHchFrmr6XKjDAjKjgZb
         x7dEuhfZ6cPB8Q1ug0r9G09DXqpr/AgdYnL8ym3ccBRLBNG10/NrzdmbDF+rGUXMWQab
         QMUFtP4KEl7vXdP91bSxnXgPSKgJKtvltpAG2mxqLb7SvHRWcPXU+Gw+QeYRtbirUFUZ
         0SXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791335902; x=1791940702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pZUZVw/r7QKqfHaSqiu3U/sawF5KkSgPe+LInuVqhTs=;
        b=BKyyReCSeXPLplG5h03AyNpGcqzMn4UVN0nUdBOfXm/jOgA1FmXgX76LEFpirosMsI
         f6eyyFkIPuFjbaefQUHK4OVLk/La7nGGwanODRqr8oflQ2sMfryVLeZ9zvDdgEB9khtF
         8B4unHYgOGQeKDbghHL/DCaI0Dz88Ax1QPk2SDd3FDpXVAwVF3WImUduDO9OUFoJKSxM
         ehhGt6ZwZvQLhZY+qcpZtci7MICGAPfcSnsNs+Vqcis6PeT5itD2f1oQG+mIZk1fC6DS
         jeVWf+Lg4I6Y/6NVEWx4ILA8/B/X2rfXQqjRxt+VkqS7q/y5s9f08r6MQi0Kko/kkG3j
         YD3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791335902; x=1791940702;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pZUZVw/r7QKqfHaSqiu3U/sawF5KkSgPe+LInuVqhTs=;
        b=ZFDIdDdDC8WXZ0OUKVkFtX8HCMLENw7+SrzCeiTdkcA9HiRQvPA4tQKUFElwVSc7nk
         4Rg26cSk8eFO6o+cZu89vAh8G3Um7ksPoL01mCxKIp3dc8Rz55Z8324BHigbt/EGc9Bk
         CdU6AxtK214VeZfTTioCMmxNuqUFrvBU+9pPgj0YKCErsUlhMEti3S0LiT4rglP377Zl
         jRPcAT+OH+I9NhPLT9w+DTZUj+PZA1kkOpg5Z8beacXbXhzjrKVIeLqyFVdQ8V3Bty8g
         aRnnSctPxd0xk6T3Z0EvZCLIjk7hsdLdU+Ff06bPSpKT9rnM9hSgcojlLSBMMOjoTVR+
         0zbA==
X-Forwarded-Encrypted: i=1; AKwUvBwhIf66aoo8y/Z28PcaPft/ClOmFEqe2gogUYrGenOVlmet6SSTzVcjKqMAjxgq2KwmARjdBRSxQfVbwys=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjIyvr7wV+o0Z9nbILdxyWxsjOD8DEMmH9xBp/9+WN+uZgTZ/a
	DZJ1lBSTZFD1XTLgIYPNDHsZB5rwN1S4h/5hREaUHGHWtpAPTGzoH2II0hQMl8FgvEY2ZJpguH0
	WlpHH5IU6L06c+Xunqt44eL0/GjVve24=
X-Gm-Gg: AYBFou2oU11MUdw04WN7Cs2B7ir4t5CndO+C7t/IbKtY+408xggH6HacAzp8NLmBinA
	XnuI/LRvYC5v9xuiqaV82BtFMeaaJJMeyQC13bOHCY2BMclL/wA/U4iwenXYfP20MowyykB/PoZ
	Qc/hB1M6MCsswPdTnA9y7G4z9W8r8xdfh8dh1VyawFzl8zKZAuaI5wveTVY9UhJAU5GZOzPik/U
	b3UsK921QZI1qzBvnuW5v3eXSVP4VbRF2xqV8qGdMW1ZlH0fSxB+BN9Jpw1TCOttS1PdsaGhdiW
	wPrWL3aKNLA+5e5ggEw1IH8jeAXN9wfS8JcSMVUFqCJQ6zCN+lwNJVCKWN1leOnLzbYmXQdFMm+
	TJoeEcGjLRrUxwh6Nj1JTD/kiyGwTt3lWA6hyPKNoT7W5ZTopD55PQqygQmFAUbiAxPduxAhPxN
	FYAwqZr++r
X-Received: by 2002:a05:690e:4186:b0:677:d35f:c4d1 with SMTP id
 956f58d0204a3-677f3936420mr1935901d50.55.1791335902092; Tue, 06 Oct 2026
 18:18:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006042230.547807-17-yidong.zhang@amd.com>
 <20261006071310.198186-1-0xiviel@gmail.com> <8900270a-064a-fc3b-5686-e37ff58c5335@amd.com>
In-Reply-To: <8900270a-064a-fc3b-5686-e37ff58c5335@amd.com>
From: Eva Crystal <0xiviel@gmail.com>
Date: Wed, 7 Oct 2026 14:18:09 +1300
X-Gm-Features: AclHuK8ByFUnVeiePKTeYtrrfEBVhs0HhR6E8dxtr1XBpLY-_TFNVqL2-6knGYo
Message-ID: <CA+pz=kKycVkwNVnQ=+eC3C39TuJ3HeGHiZC-UX1mszV-05rNaQ@mail.gmail.com>
Subject: Re: [PATCH V2 16/20] accel/amdxdna: Finalize runtime PM before
 acquiring dev_lock on removal
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: yidong.zhang@amd.com, quic_jhugo@quicinc.com, 
	karol.wachowski@linux.intel.com, max.zhen@amd.com, ogabbay@kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	sonal.santan@amd.com, mario.limonciello@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=E2=94=94=E2=94=80$ sed -n '/^You are right/,$p'
/home/iviel/xdna-audit/aie4-kmq-v2-reply-16-retraction.md
You are right, and I withdraw the claim.

The step I missed is pci_device_remove(), which calls
pm_runtime_get_sync() at drivers/pci/pci-driver.c:527 before
drv->remove() at :535 and only drops it at :536 once remove returns.
Once that get succeeds, the device is RPM_ACTIVE for all of
amdxdna_remove(), so pm_runtime_forbid() takes the early return in
rpm_resume() at drivers/base/power/runtime.c:820 and never fetches the
->runtime_resume callback at :936 at all. No second dev_lock
acquisition, no deadlock.

The AIE2 deadlock claim is therefore wrong, and the Fixes:
1aa82181a3c2, Cc: stable and split-to-drm-misc-fixes suggestions go
with it. I withdraw the drm_dev_unplug() question too, since nothing
resumes on that path.

I had not reproduced this before sending. Sorry for the noise.

Eva Crystal (0xiviel)
XSource Security
https://xsourcesec.com
