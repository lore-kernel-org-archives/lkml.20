Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF161EB1AA
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 00:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788654118; cv=none; b=u1KFJtYBUIhhsHiSbyFsrqz4zia55y9NBzL5AEzxrF4Rx7pPpWcx/lFsB9NxgSI7T2MiewmsP+xbF5Tg+Bk3KO8PdPp1Zx1BJwls6GdzUMlw0o//kIpOhb/+kJvoKzMbTqs721pwXwN4EknYFhIy52nI5EcPU3n9KJdi8POrcZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788654118; c=relaxed/simple;
	bh=bANCkv74bjVkNmw2i1bBp4PEjTFYNJHoUrMGPwTQrbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YRlu+8VZSsQqrlbvh5DF6E+XUBlBcfEE1t4D6LPrptjTHN6MqkMgJiR8vj7QjJUBIsGJbm8Arf7DA6DlMmL291jNxNDiiMWGiR+NKzt7QRKML8mn817bRgMbI1PQBHXz57ohf6TrX2g0tGFyhe/NlFdl67gYctuK9t/4CIQ69yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rj+3jhmB; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rj+3jhmB"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b159850b16so2217504e87.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 17:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788654115; x=1789258915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mbngxJwnoEkVcJ+SwI6uR0MJaawYw2SIyOrsYxc60no=;
        b=rj+3jhmBB9xlmH8ZQKUyNwBFumHOmxXmOQIUr8GW4uIRQxE/qvoWRJp7JBpJJnpk24
         dDUwSz3FSFp8k5snQEXt5k4xaIJAl2qkv1jPLFHo9qjgTICsf6fKks2ZxAADRdaRllTb
         HzHaF54GyLAftp8qQ3gjo03JWQS+kK2aEWI6QFmciypOsl0Baw8aEIeuaj65er4lzY43
         gC1GYpAhyR3r+XXufFEabTDw/uNbBXcIx7a5iqPSfTHAWaleTgGgdRdOMjz1v6CPYW73
         z3iteVVHcBxSMKGtgR2//FvV+NTF5EFVTilFxI+3QvXK8dgIFmOLa2VhFP8OfwcgfRFf
         Tr3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788654115; x=1789258915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mbngxJwnoEkVcJ+SwI6uR0MJaawYw2SIyOrsYxc60no=;
        b=jRnYkZPw1RahsFhyt16daHT42KPRTIeS0Z8oBt5mIdzUc4pNDKfd8GOuK+OfMwyczr
         DGxnjfy2qYmsvX1tvj0F2kqgfrJ+LakIHMSshK5vnE3mBOWLfMEbuBhva1ZDvgKW8unP
         iTJKcjt9V5s+RBBH3qD/vAWWYThLtBdABDUkQ1MxHrlqwtmCK4rEhr+TcxlXqjPSvHWG
         Av+AW2cJhj9EDFmeAGSiEa9d50u25nLGDAwAz/nvw2DFGFSRBQ0gj36yCMRtpaKKDTYa
         xBf/ogc1M+NKtViXCp+vYftOlMdQ/7fjYzFVYs+hsOyGgY07yRdQIRjEG8DebFklfzH+
         mjtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWTOFtfStSOwr/KGx98h/qpP1raXnS3bmsA2L7H4haDWqfeoZ6LOwSqF2AwbilRR7KGNxk8n7K2/9T1sc=@vger.kernel.org
X-Gm-Message-State: AFuF++lQQLQLqDut7OnqtE/dxKp6eYit30aZdmDAr+Ed8r2Sbr9UukK2
	K6X0BdBm61J12SiTJw3wtiyuTSRylR7j5uIrDRC1RwAxCa/42/yx5YLk
X-Gm-Gg: AYBFou2FI2szApFzRfQgX+LbhIctAWwwmagvH2THN8jBSxvKB7DvnL883iUiGBOrofp
	lg+zxQfAw+P/ae8jQ3FkgxtqD0Cu2rt8wvHBr+bxsozMPZXsgLFNJU1dhnR58MDVn2ogiAuAuDn
	QZhfd6ny235mvrghzNRPC2GU9wd75kxUvOillaMDL3moga3KR2re4J7bp2ZePLfmjMWXgu1Eo2f
	PFbczjy3x+UINNgWh7PH1g+E6rBIa/sEpjfn3hKZLz5oQpfFyiErc2+pdA4flUhqSxKnUQTL9tU
	aXRjcv2v96Dvxe/zwhEvYAlcLnBOH8ie7VKg4eAEe33nXU08zEBbzFnRhP5XZ3Rxoi21j5YZtb1
	EXCLtLDnyxOoRtuiPd+NslEId5mfdqtsy35Baf94n8MB47aS/7bCT9T4TrhEXE/nX+rG1DSyYq7
	4f+3svAZq1ZO0H3Kt0ScYSGK02YygmvLHWpE20awF104OUskjcvhJAf9NN8l+jkRtTBhdBIc0Eg
	dcpyw==
X-Received: by 2002:a05:6512:224c:b0:5b6:425:4bef with SMTP id 2adb3069b0e04-5b61706a350mr3872124e87.32.1788654114805;
        Sat, 05 Sep 2026 17:21:54 -0700 (PDT)
Received: from localhost.localdomain ([80.66.93.17])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166ecf3dsm1352411e87.15.2026.09.05.17.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 17:21:53 -0700 (PDT)
From: Maxim Skokov <skokovmaksimevg@gmail.com>
To: pkshih@realtek.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maxim Skokov <skokovmaksimevg@gmail.com>
Subject: Re: [PATCH rtw-next v2 00/14] wifi: rtw89: update RTL8922D capabilities and settings, and enable P2P device
Date: Sun,  6 Sep 2026 03:20:50 +0300
Message-ID: <20260906002135.5118-1-skokovmaksimevg@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260902052958.50371-1-pkshih@realtek.com>
References: <20260902052958.50371-1-pkshih@realtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Sep 02, 2026 at 01:29:44PM +0800, Ping-Ke Shih wrote:
> This series updates RTL8922D capabilities and settings, and enables
> P2P device.

Tested the chip-independent parts of this series on RTL8851BE
(rtw89_8851be), a 1x1 Wi-Fi 6 part, since patches 3 and 11-14 touch
common code and thus change behaviour for every rtw89 device.  The
8922d-specific patches (1-2, 4-10) were not exercised, I don't have
that hardware.

Applied on top of rtw-next commit 81510c3d6f21 ("wifi: rtw88: debugfs:
don't vzalloc(0) when rsvd_page is read unconfigured").  All 14 patches
applied cleanly and the build is free of new warnings.

Patch 3 and 14, interface combinations as reported by 'iw phy':

  before:
    #{ managed } <= 1, #{ AP, P2P-client, P2P-GO } <= 1,
    total <= 2, #channels <= 1

  after:
    #{ managed } <= 2, #{ AP, P2P-client, P2P-GO } <= 1,
    #{ P2P-device } <= 1, total <= 3, #channels <= 1

Patch 3, two station interfaces in SCC.  Second station vif added with
'iw interface add', given its own MAC and associated to the same BSSID
as the first one, so both links are on the same channel by construction
(5180 MHz).  Both associate, and both carry traffic at the same time:

  30 s of concurrent ping to the gateway, one flow per interface

    wlp2s0  90 packets transmitted, 90 received, 0% packet loss
    wlan1   90 packets transmitted, 90 received, 0% packet loss

  station dump after the run

    wlp2s0  rx 1225221  tx 27526  tx failed 1  beacon loss 15
    wlan1   rx  128239  tx 16140  tx failed 2  beacon loss  0

The first interface is unaffected when the second one is torn down.

Patch 14, P2P device.  wpa_supplicant creates it on its own during boot
now that the driver advertises the iftype, and NetworkManager lists it
as a wifi-p2p device.  The driver runs with three vifs at once
(two managed plus the P2P device) without complaints.

No WARNs, no backtraces and no rtw89 error messages in dmesg during any
of this.  Association, DHCP and switching between 2.4 GHz and 5 GHz all
keep working.

Patches 11-13 were only exercised indirectly, through the absence of
regressions in association and channel switching.  Patch 12 is a no-op
here, RTL8851BE has no 6 GHz band.

Tested-by: Maxim Skokov <skokovmaksimevg@gmail.com> # RTL8851BE, patches 3 and 11-14

One observation that may be worth a note in the cover letter.  Since
patch 14 declares #{ P2P-device } <= 1, a second wpa_supplicant instance
on the same phy cannot start: it tries to create its own P2P device,
hits the limit, and then gives up on the whole interface rather than
falling back:

  nl80211: Could not set interface 'p2p-dev-wlan1' UP
  P2P: Failed to enable P2P Device interface
  p2p-dev-wlan1: Failed to initialize driver interface

So the two-station setup that patch 3 enables needs p2p_disabled=1 in
the second supplicant config.  The driver behaves correctly here, it
just means the new capability is not reachable with a default
wpa_supplicant, which someone trying this out is likely to hit.

Thanks,
Maxim
