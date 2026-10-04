Received: from mail-qk1-f228.google.com (mail-qk1-f228.google.com [209.85.222.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0723B47D5
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 12:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791116932; cv=none; b=JA2LcmxjyXPhxFoIoqOrWhCRcfVUdJmabkyJ+wo7BOESntXIY7qUQBSdpSCSQX8XrIyJs2Oya7LPSS94RTvWdCjf35vmGervYYIWF+lacLvF93DTD/uEjZbDLH9X5HllHkr1hJe2GljznVBZFl6rX8cpDXQ9pXm1UGOfvwfucmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791116932; c=relaxed/simple;
	bh=xqMc2nFRzl5bCD+ATJaS5tK92XhGJq67FhleE6gkzk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MmJgE5grsaUZi26idrm8rBX1HASCBNfil1dLp0n6jdCSPJVG3rKqDrpMa+UTu97pE+8WQZ5n7h/KYqo5coQ/e9CjzhiFaySVOi/OmBPoiMQyYZDz9fmc+Avj/0Ooe8thSZzVfmOnqtk7WNgzFLgo490krJnkV3UCNMJiAKUGIWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=cUnwRVsX; arc=none smtp.client-ip=209.85.222.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="cUnwRVsX"
Received: by mail-qk1-f228.google.com with SMTP id af79cd13be357-93e6cc9f68eso20938385a.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 05:28:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791116929; x=1791721729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+8JCCrShX/OiK0rjMqICF2+soAKosuntY3aTL2G77+Q=;
        b=bhcYKASFRgo931R783BAk9nTvNCh+Lnq9a6Lc1VOxAQt/SJ16S95bZb33Ot1J7KUC/
         i3DsHWFDzpPnAzFtluRfqdgKHqFuVFiUUFH0K8qs2MpB4N4Zhbb0Jq/QvFDolOp2O4y6
         OQecY9LQSrpjyVVVdoEpwA129CJ+Z3XZPmphvKaz3o/XIk//sUobPkEUvaLmP0ri3XuW
         vEcZ+YAvA9b9L/4Ji+DglL8HaWvvSy8SbSRk2dOC5tST5pzdinycW/0HA8H6xV38Wssn
         2ajxPbi//zesUJs8oJJRQ5AYpaLD7/TP8ix/XfbGOMt9qRtSndnluP1IyFwiUF+epW2Y
         h1dA==
X-Forwarded-Encrypted: i=1; AKwUvByAlayPg9kYSZwkZrzmrGNFFsV0s83R07py04JKqxwOCODnbWwbOyiDU+yGy/v/fugJESs/1wMCfDpzrEE=@vger.kernel.org
X-Gm-Message-State: AFuF++kGOAbQnMBX3unDe6AjLWWjNz01usVcuwmxp/+TGD1xJA2+Oj0S
	B400qHgj1RcqRGAC1IfSi6BWskruCOPZPkKf1iUEiCTpF/woGAvDYFQai9tNh7l6lVtEP+Yz14a
	npAElMLSyzPWl/9S+hL0M+Dg3e7MgNF5Udso03HyxlF2vwkxSAYr1KvyWY1sZW/joCQYMWgCE4g
	/Xvm7JUKwnliZwt2Tn/XHUp1wKVbHiPoks7Z+6WtjIFkrHp7MKFKwAw/LnqcJAzYUA0Qbc5/9H9
	j6m0v6fFoS9KzsOMW5pN1kRcA==
X-Gm-Gg: AYBFou08dDh54ezgtqOsyak86DezYyxdvBgLg5CseOb28GrV7atZ+PVTUhmCp0dB0lX
	jl6y5yh/CcgxH2nbJfiR8C76gSDn/lsiooY1E/gjwJVJMvgQQ02jiXB/v6gV63bJK2B5YaxUryE
	3fbfL2rUr/tnYRUnnm7PEbiE/HoQBDzcZwRtwDwJ31/vpGnz9TG5VFXU8sF0wv7ggMPiikVm5+G
	+3Xx8Xmxp/AerA4i4S3g8VkDYxDYE0l8W6/xS3XQGUZDnQHCS4Z9fUTdNE2OuLzWZtzbMksJGTN
	KWXyuVC8ik51+5rdg+0zjDYMyWaYByG210XJzCnLPWm5Oi9f+zL5ohPpf39lgwLs7aIBaRzj9Cm
	3QLYe0hJcynrlAs4poSV/qADKeOT3L3ji7X4GYcyj9VvtyAByWXY/5y7kwTwH7tPFBwvcqPXGY3
	jr1HOpdAldDPQcHyNzbF/AuKfwtbVxp3TEwj1l5Elo6w==
X-Received: by 2002:a05:620a:1a29:b0:93c:c162:125b with SMTP id af79cd13be357-93e51039a08mr833319685a.39.1791116929390;
        Sun, 04 Oct 2026 05:28:49 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-93cca29a552sm286038685a.7.2026.10.04.05.28.48
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2026 05:28:49 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34d80ca2184so1320053eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 05:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791116927; x=1791721727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+8JCCrShX/OiK0rjMqICF2+soAKosuntY3aTL2G77+Q=;
        b=cUnwRVsXsPG/PIB4q2PWtnoj1d69lRu5EODrr5HRM0LiCI+LTDSkS4g8mPkwFfr6z6
         xe2OAMWufzAZSESngP5t0ba2a2DU2NNGGMxAlnnPMWrVRqcj9Ml5RqvTIfXoQNqn8Pkm
         uXNNTcM3ml0SkKGUen0J6oGTpEbk+XnUxNBZY=
X-Forwarded-Encrypted: i=1; AKwUvBzl0GyI4teaOUtOaeK6risgJmKu0ZaTUhJBjILaDyMJyjfCNQKBWbOLmpHwQlUiSY//wqJSU5ybMsydQJQ=@vger.kernel.org
X-Received: by 2002:a05:7022:5f01:b0:153:e0b1:5b5 with SMTP id a92af1059eb24-153e0b107ffmr3054135c88.31.1791116927040;
        Sun, 04 Oct 2026 05:28:47 -0700 (PDT)
X-Received: by 2002:a05:7022:5f01:b0:153:e0b1:5b5 with SMTP id a92af1059eb24-153e0b107ffmr3054112c88.31.1791116926354;
        Sun, 04 Oct 2026 05:28:46 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fc39a7d1sm12234015c88.3.2026.10.04.05.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 05:28:45 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Benjamin Drung <benjamin.drung@canonical.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH 1/2] wifi: brcmfmac: Add per-board clm_blob firmware binaries
Date: Sun,  4 Oct 2026 05:28:40 -0700
Message-ID: <20261004122841.1391116-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260923203739.2560527-2-benjamin.drung@canonical.com>
References: <20260923203739.2560527-1-benjamin.drung@canonical.com> <20260923203739.2560527-2-benjamin.drung@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/23/2026 10:37 PM, Benjamin Drung wrote:
> On Ubuntu 26.10 these firmware file are missing inside the initrd when
> including the brcmfmac kernel module:
> 
> ```
> /usr/lib/firmware/brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.clm_blob.zst
> /usr/lib/firmware/brcm/brcmfmac43430b0-sdio.raspberrypi,model-zero-2-w.clm_blob.zst
> /usr/lib/firmware/brcm/brcmfmac43436-sdio.raspberrypi,model-zero-2-w.clm_blob.zst
> /usr/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.clm_blob.zst
> /usr/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.clm_blob.zst
> /usr/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,4-compute-module.clm_blob.zst
> /usr/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.clm_blob.zst
> /usr/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,5-compute-module.clm_blob.zst
> /usr/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,5-model-b.clm_blob.zst
> /usr/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,500.clm_blob.zst
> /usr/lib/firmware/brcm/brcmfmac43456-sdio.raspberrypi,4-compute-module.clm_blob.zst
> /usr/lib/firmware/brcm/brcmfmac43456-sdio.raspberrypi,400.clm_blob.zst
> ```
> 
> Commit 885f256f61f9 ("brcmfmac: Add clm_blob firmware files to modinfo")
> added clm_blob firmware binaries, but did not add them for per-board
> firmware binaries. So add a similar glob for the per-board firmware
> binaries.
> 
> Bug-Ubuntu: https://launchpad.net/bugs/2168109

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Benjamin Drung <benjamin.drung@canonical.com>
> Reviewed-by: Matthias Brugger <mbrugger@suse.com>
