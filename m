Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794293861;
	b=aw4VhCfDXVx2wLYnRDeH6z70Iej17q+aZ9Vam/39kaDc1/LvNXd2OajOnzigeABCQKWk
	 /7azXQo/vsIIJt0H1ebqnLBC2I2bZOIp0HDjGch0LrdYPVci2aDNd7tuw5akwE4VMM09a
	 rmape0vtCFMZTdSe3Qkmdg9XGww/IBrgUsgAtbl3vLho6K1TDqqAKYMdzk/8A1kEHBPnU
	 Srm+bunKEbaIGdZlFH4Iaaio115wYWrijbUUyiQCKP2n7DUvZiJFuSb1mHoErJ7m5KjYK
	 n0Pkg4efPmdxlBwi94lMxyLtBOpojW64Snc7VG1iv/XqesGSKV8UO1iC2/UfE2ZQX3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=FNCN9F8ROMGrrVoJ7iFWkLhPaPG6W+ai/dJpDmC52jM=;
	b=siptrp1oLcRlZ1KUASTSUJdqPLD0QnGomKbyM3q+YfC5Ewy0YU+6nvcoOVXIi18HyNJh
	 DMAbBqHMKXmMXZj9ZNCV3FMrrrm+ACX2/+oZmRhbCZF5IIQCsqrmzAsPtU3D/g8dadTgi
	 IItXQeaC4hFOWwN0DmjapwaKgwfTL6XgYX9vSafRSc2L0ldabCsF9yeoixbledOqdJbUt
	 ZipM3E2aPjblZ6HIlXrdLcUQLWEnf9LJcNqecfS8n14mywpdx4ZTvKIqO4XnK66UCCRpc
	 RYbgIfIXY1arQVLnU4ALLeEO4i78AsAiE9xCN7f9xPKM97sX7VkD6KzipCSvBEW1UEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DYx5x3k6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.53
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61B4606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:57:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C61B4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DYx5x3k6
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-98301b325c4so384839241.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 22:57:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794293860; cv=none;
        d=google.com; s=arc-20260327;
        b=bEfdJWBK0dOB4MwYbwRJHsisQO0bmE23Jf3mmjEhOJtxHQRFaaaA23ozh86EQvtM4W
         HtJsbI3WadOApgOIfeehICo7i7UOKzlaAxEnajRJjO/D7Law2Wma8/2NZVzyDMDO3ij7
         RL8dvzPEHszu+xBEvg3eOWqVBlgjErIG1ODRQMMTlqFBwhl0coTEVL+h2QuhtG1a9XSO
         BJGbigfgoKIrVgrDyDBjGdil0KUFb/0KNFKNP6YQqNM+Hf+iSxhl5BF+4EYANyz+mC21
         VQxzArUXASLG69iVlrN3Nzq+xgbGCnbfkADDOn1FNILeb3HLb/zS4eQ+5w0onqXR7BP9
         ljxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=FNCN9F8ROMGrrVoJ7iFWkLhPaPG6W+ai/dJpDmC52jM=;
        fh=OUQO7wevQo8h7JledCTtXdcFqFD+bYS6Xp1Tfw0W5n0=;
        b=aqEK6f7sAfI0zNr4vN5TmoRyEEC2sEuHJeqeK+j586G9tOgmpMWqAdharIf9xzP58E
         e7W6qV6QgzZxImNZtH1uabC7dlUstdDrlSMBueoOmMy0QkCaa3EKIXRKWDPXNnCGoiC9
         pAc/9fX5Eb/+yyYTucNsSiv/rjckB3DdfLBe+/ywJxvtSimSA8BCQbi6Ac2fzvoB4hSQ
         4/5HtDjjVFHHeJ2Uf2rOnQNmoRmgzlsIFXqkFLvWSkNGGsJfPaoovtcHPZgTLwyzLAlO
         PVtwxiEdT5MobHbOP6z3IKyZZfBY6+qfkXkTl+Ad43eEIw6qQsJft2/mF1auJLzjNmp+
         xaiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794293860; x=1794898660; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FNCN9F8ROMGrrVoJ7iFWkLhPaPG6W+ai/dJpDmC52jM=;
        b=DYx5x3k6BHls5LLaGg3W/SFXDaPSyN2VxVGh+EtpC8tX9NY9SHSnCzbswcuRzBWtAu
         2JsFyctF09tSkIM5XcoHrG8fCj9W9ERFb/3133QsrxbRiQSt29Y1avDqpL8dZXu027vI
         PCtKrLzlEO+EXuEXAWOS6Jre7uXy0hgMJC/+dA4RwaN7crRRwcjuKkTKkAf4FriyEXbF
         vWHIITq+gjFie/ph4NN/R8A75p+VwBuz2YnYMa8jDacDbxXyhPDzofd/RCpJqgie6Ot5
         vBfKDPRxaQzHVxq+NwXUhnRiY0quw1pbkhCCY7Hyzc9mH+YiJ3YAFu2xRqPwWtR2xS43
         XDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794293860; x=1794898660;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FNCN9F8ROMGrrVoJ7iFWkLhPaPG6W+ai/dJpDmC52jM=;
        b=N8BtA5I2Q6vnB5Ogpufbn7m7ahk8plhKnFNwgkd8X/SkWYCKUp6S7Cq+cbbq1emjJW
         FbM1+4UdR9oF5+FiSFSZgeQjwje7ca9zZJxMmpe4MJMc9vi4w4mUBvIiNOU+thGTn+26
         bjwgM5gMujBdGL9jncJPSH7FIFjdP93Tz8BMhs56e9BpVL+i4oTuwbKFV6ZCoii+SfWn
         Tk1Smm6gAK5pEzC36KvMBNwrNAf8coypEPNbyPuRlHG8JlJGVY9gufyLB1P38HO0JxQq
         BYs46eM2WXFn84w8bJjMi7gzOMgPHPousf/ydglq/U0qwHRkHRKpJUd2/8SkzuY1Pfb0
         EZFg==
X-Forwarded-Encrypted: i=1; AL+hErHPpWgNEl3V0BQuYa5O+8L/hlU1IfYRZVYvSVG8RM01e0WfKfJwH1LfPfB/nIkWv8CFNNJMypoimqXjIhU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tNW70IlkGiS7+rQToFVwYJp9sNL/4V7CbEu7AlcV2AQcdfzvY
	XL8bkdmESNHGCiioFAc81xqocT6EQG795j0hoxas19ZmqGe2K9drU6wQ3NUhSL0psL2baeMsXPf
	tYqMfxP804eJGNcusrXzd1ZvyBY4Zd38=
X-Gm-Gg: AYBFou0cExVcRf6q9v9TLXGsc1ENjrC12SC4cosTxhQLuNAvmLr1H2idPjSZU4bNw/h
	4l9l1f9B4+zScnR8A3vzfPDicA3VGnT4YqMl9WKoi5V6o84KwxHcevoNdu73wgLwIK9aSe9jKIa
	/OGs7+owsQgma/mL7z7t5tPIrhd+U2qx+BRzTNGQidF6i69c7Qgm0mwOIwVqVt7afOAh1Fma7hW
	Z5K4QuvFQaXod3uBhoHxa0wl6hZCdnGh6ypWTlBjM1ZImqig486elwmdqr8FgXJpSGLUTy661jI
	t8vL896zp0rkGnv3dB1AU0k5jI3fSvtBWGezyEGqkFg/fdRKCIDnkHagXjeDxQSGQFNT48FI0Lc
	gEJxprWFyzX1SS1ezm2G/Ikhan86QFKfQxEY7METZ5gjhAIXubp4+Bukni7dzvQXhm6pu3JfVbi
	CcUwC3E9cIydB0LIW/
X-Received: by 2002:a05:6102:f13:b0:7c2:5692:1917 with SMTP id
 ada2fe7eead31-7d301b8446fmr459013137.10.1794293859655; Mon, 09 Nov 2026
 22:57:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Christopher Griffin <christophergriffin05@gmail.com>
Date: Tue, 10 Nov 2026 00:57:28 -0600
X-Gm-Features: AclHuK-ugbccll-p_Y-1vjiqdOoRo5wtQJSfTOSPG7IArA7RJi8LRKvYE_A9LRY
Message-ID: <CAKobHXAfLKmJWSP_xNKwmNVkd4M92XhVXkVMcG5nxCBnbphH5w@mail.gmail.com>
Subject: Re: [PATCH ath-next v5 0/9] wifi: ath11k: airtime queue limits,
 airtime fairness and a driver TXQ scheduler
To: julius@bairaktaris.de
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org, jtornosm@redhat.com, 
	baochen.qiang@oss.qualcomm.com, rameshkumar.sundaram@oss.qualcomm.com, 
	toke@toke.dk, sven@narfation.org, john@phrozen.org, 
	tamizh.raja@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

(In reply to the v5 cover letter,
https://lore.kernel.org/all/20261018174904.1757161-1-julius@bairaktaris.de/
which my mailbox doesn't hold, so this may not thread.)

Hi Julius,

I tested v5 on an Arista C-360 AP: IPQ8074 (AHB) for 2.4 and 5 GHz,
QCN9074 (PCI) for 6 GHz. The base was OpenWrt main with backports 7.2
and the TX flow control v7 patches 1-3 underneath. Flow control
patches 1 and 2 needed fuzz 1 against OpenWrt's IPQ9574 patch; the
rest applied as posted. I swapped the modules in RAM and ran A/B/A
against the unpatched driver.

2.4 GHz, ch 1 20 MHz, two stations downloading TCP for 60 s each:
an 11g-only station (a FastConnect 7800 with HT/VHT/HE off) and a
2x2 HE20 station (BE200). A wired host pinged the 11g station every
0.2 s:

run | 11g Mbit/s | HE20 Mbit/s | ping avg / p95 ms | ping loss
without (A1) | 1.6 | 64.6 | 5275 / 7710 | 4.7%
with v5 | 1.5 | 52.8 | 375 / 769 | 0%
without (A2) | 1.6 | 68.2 | 5415 / 9953 | 6.7%

On the slow station that's the same bufferbloat cure your cover
letter shows. The codel drops land where they should (385 on the 11g
station, 89 on the HE20 one). Its share of the air stayed at about
5%, which matches what you saw about the firmware serving queued
stations in turn.

6 GHz, ch 37 160 MHz, one 2x2 HE station (FastConnect 7800) alone,
TCP download, 4 streams, 60 s:

run | Mbit/s | TCP retx | loaded ping avg / p95 ms
without, run 1 | 1609 | 2928 | 31.7 / 57.6
without, run 2 | 1622 | 2333 | 17.2 / 27.7
with v5 | 1154 | 13100 | 6.5 / 13.3
with v5, fq memory 16 MB | 1340 (*) | 8077 | 10.4 / 24.3
with v5, fq memory 32 MB | 1398 | 2073 | 15.9 / 33.2
(*) steady part only, after a client-side reassociation

The default run's loss wasn't codel: the station showed no drops or
marks. It was fq_overmemory, 409 in the 60 s. mac80211 gives the TXQs
16 MB only when some band has VHT (ieee80211_txq_setup_flows()), and a
6 GHz-only radio has none, so the QCN9074 radio got 4 MB while the
IPQ8074 5 GHz radio got 16 MB. With AQL the backlog moves from the
firmware rings into mac80211, and at 1.4 to 1.6 Gbit/s 4 MB isn't
enough. At 32 MB there were no overmemory drops. What's left (-13%)
seems to be AQL's own cost at 2-stream HE-MCS 9 to 11. The 4 MB cap
looks worth fixing in mac80211 on its own, for any HE radio without
VHT.

I also tried the series with NL80211_EXT_FEATURE_AQL left unset on
the 6 GHz radio only (aql_enable 0 should behave the same). The radio
then ran 1810 to 1906 Mbit/s for seconds at a time, above the 1615
without the series, but it kept overrunning the TX buffer IDR: about
14000 "failed to transmit frame -28" in two runs of 60 s and 45 s,
each burst followed by a dip to 1000 to 1400 Mbit/s.
ath11k_mac_tx_push_txq() checks the TCL ring for room but not the
IDR, so without the airtime limit nothing bounds the frames in
flight. It may be worth ending the round on a full IDR too.

One note on 4/9: tx_duration there is the user's fes_duration_us, and
it's registered in full for each user of the PPDU. For a DL OFDMA or
MU-MIMO PPDU, that charges every station the whole exchange. My
duplicate of this patch (below) divided it by num_users. I didn't
test MU here (OFDMA and MU-MIMO were off).

That duplicate: I sent "wifi: ath11k: feed mac80211's airtime
fairness" on 11-08 without having found your series. It repeats your
1/9 and 4/9, and I've asked Jeff to drop it.

With the series as posted there were no warnings, crashes or
firmware asserts in any run.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.r4-00683 (AP vendor's build)

Tested-by: Christopher Griffin <christophergriffin05@gmail.com>

The tests and this report were done with Claude, an AI coding
assistant.

Christopher
