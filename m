Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793045769;
	b=s+orHWXxNaiZEMMqzLY0GrE+TZXoE26v3TQtGqknInPQ+tCYXtFSkdAxbyOIZTDfrdkv
	 lcWZUL33Y4hTv/vjILRfOMfRl8k+YTWqSLBZlKiKnOq6i1zCkGTQREq8YWcJjItum5nYa
	 +TIZSjDEOrmd24+Fh6VQA1c7c/iFRbTnTQv2TAnRoMRJTJJK4tu/aQrBLuQL4LfHyeipG
	 e86C7+d1evpPFY9kk5QL4wR7KqDtEuYIBZuGCzsJ1ItCQYzHBwMQVZUJ3YND4oqs7YC3D
	 xRuJLR8YRlGaRYCjrHzdU9HzUA9JDEV1tOgtS69wNBRwM4XvPTlFole++N2zFnA4MHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793045769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=G8ZkJMjWlhMk4Veu++rAUd1hw9BdTfvoHNAmC3I1U9k=;
	b=jIny8oPgn/XkPvVEHE8KOmLyzMwk2plaQ/NpfvmEDpxABN5oGOk0cEr+QVEyJRamMGSx
	 tf20kTZlkneR/ovyD6xnemdidN73T+aCyjSHCmIBby+dM1pc/Mfx6+qmgzppYNOoxIMOc
	 R0O0D2J3G1H7iEv+X80blfJXZjBe5IlzU4H8TLH7Equ8JFcgXUAhk8hXhZu0Jg0SfCI3H
	 9GEzmkTZ+lNGWMVw90Zxtuu97TB/JCCPKeO7b4Enbr9Uz9q+2S0a+PT3ZtItf7UmcPtAr
	 x/SURTfQWTJ6NF0QOayQgPc9b19DzqW7IkXTwiheIquBbjECQawJ4YAtF2kgce5lYTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ODZHIYQz;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C35606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99C35606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ODZHIYQz
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35829219da8so371188eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793045768; x=1793650568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G8ZkJMjWlhMk4Veu++rAUd1hw9BdTfvoHNAmC3I1U9k=;
        b=ODZHIYQz2E+WESqPCtOXOANaKxkx9uHuqZabDw6NrL3jIxjHezvUw9FbLNvlcDZh4d
         M1fr63jjIywiS90B9wE9SoJtxO87Le26YCPrB4prfAS9gLZvdMFzB2sPAf7I+dIJ1Hk+
         /E9067A/HcX/HQreZUCMoK0F1y3bUNrfZRBc6zwwBo1rnbSqAFVoFuxYVB1oIT/P8Cv0
         Qwi6GmbZstmMbmtlOrfb99CmhwWsaqIoWTlPl/9yx/LAwMMuWQHCyiQ7cjQZjHNnBR7K
         7FIg2JSwUVp2N6nF964g/SzpbykzH3NRcFVwfp2+lrLKTQkVoLH5Pv5pZHtESg5tmokA
         hCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793045768; x=1793650568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G8ZkJMjWlhMk4Veu++rAUd1hw9BdTfvoHNAmC3I1U9k=;
        b=fs8nKVZ/hLErZYycft0bc3aSzJLBfMU2u9DuZhY6G9ViE6SuxO0rDTfmGScuAGO9M6
         +VRmbFK6DmYpTPZYTo6EaSG89QXFbjADpMSnvpZoc1af8Uyg9FgETOIYytTcY0t14gy5
         eOoGJsiaNNwXOWuaQKw0c8v2N15HEIrNYPxX5lr18Da2G/FKhrWA+VcYscWxyVBWCisZ
         oGCJtqxzldD3vysoIB4S8bQMwGqd9ffjHte6U7fGyr9rU+Rj/hrZtOtWBS5sRjAQBH98
         XfquS9Rxla2m6Tb0IpYSX+shiFPVAmV/FEaQ2LFJ9ufbQRb09J76It+C0gKDbuHXULOm
         TXIw==
X-Gm-Message-State: AFq9FYKJaihL1vPp9Q/zDd2dUB5K932Nm0AGwT7tSYJg1+27m8sRL4Yj
	prTNHc3T44c5ISHiL25RJWQCK4WSYEqUUBGe2mVmfAVdx0WWmFXk/T74
X-Gm-Gg: AYBFou355ftTzvTOojIRMLsjrFOoDEtwGuO4PrcAmGsB1wYl4hRrT+QEmFeqUc9Gjca
	WSecUKRWTKqU/8hKAJDdI7wncc2PEQZQYpvjlWDRT9LGFNIUcpFAo4pHsDfgkWAMRqSDfTzDN9z
	h6BHPLMtbGL6sZD0iQyTISGJc3SomSffjAyqBnQST2rMXZT0iFPutkGkHvLiMQUZu2nAWd8poLZ
	S+V9gt97D/fPAloSgWat1PFWvHeclzc6SGxmfKOJuL+r0dFKTTWhacY6vYbnTGo2zJLJg5Mkxob
	LGw1OkTzIKuhEydPuaUlWNnTlVpoZUaUPf3YtXXOiRYnD8/zoVueYXKNKh8g92KoNKTyEdqQ/CI
	PnVrIoS5dF/jnRX7XnafhXcCD+bPzokx3/4BPnoigef5xV73DOcEf3xW6pbCLhtv+lae3ahddRG
	U5P/kVQRdGUDkVVi0/3laduNA2igB2QkAtmp+VnbgrPi0eNQtbYThHTqtdqFJZCuwlWUdWZdLry
	F3uB6BLagMeZPHJXwJCFQldlU51XlD9jTpT0va3sdafCE3ZU0ZeE1a+ApqBeKzepsyOk4U/UulD
X-Received: by 2002:a05:701b:455c:20b0:143:1bb1:3305 with SMTP id a92af1059eb24-1a3c9cc2353mr731661c88.22.1793045767511;
        Mon, 26 Oct 2026 13:16:07 -0700 (PDT)
Received: from ZephyrLabServer.internal ([165.162.64.148])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm25994089eec.21.2026.10.26.13.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:16:06 -0700 (PDT)
From: John Macias <dencity7@gmail.com>
To: johannes@sipsolutions.net,
	linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless] wifi: mac80211: use HT CCFS2 when computing the AP's HE and lower bandwidth
Date: Mon, 26 Oct 2026 13:15:29 -0700
Message-ID: <20261026201529.3471565-1-dencity7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <116e1f238e2d78817a2ac5b42b00e0faeabf16bc.camel@sipsolutions.net>
References: <20261026040148.2633920-1-dencity7@gmail.com> <116e1f238e2d78817a2ac5b42b00e0faeabf16bc.camel@sipsolutions.net>
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

On Mon, 2026-10-26 at 12:07 +0100, Johannes Berg wrote:
> This, by itself, is wrong.

Thanks. I think I see why: CCFS2 only applies to a STA that can
interpret Extended NSS BW, and my patch applied it to every station.
Please drop it.

I looked further and may have found the actual cause, but I'm not
certain. Below I've separated what I measured from what I concluded
by reading code. Corrections are very welcome.

Setup: IPQ8074 (Netgear RAX120v1), ath11k, firmware
WLAN.HK.2.0-01792, HE160 BSS on channel 36. Clients: MT7925 and AX200.

What I measured:

- Before any change, "iw phy" on the AP reports VHT Capabilities
  0x738f09fa, prints the Supported Channel Width as "(reserved)", and
  shows "VHT extended NSS: not supported".

- In the beacon I captured for the original patch, the VHT Operation
  element has Channel Width 1 and CCFS1 0, and the 160 MHz centre is
  in the HT Operation CCFS2 field.

- Both clients report a 160 MHz link. On the AP side the peers were
  set up as 11ax-he80 and the AP's transmit rate to them stayed at
  80 MHz (MT7925 download about 810 Mb/s).

- With the change described below, "iw phy" prints "160 MHz, 80+80
  MHz" and still "VHT extended NSS: not supported". The AP then
  transmits to both clients at 160 MHz HE-MCS 11, with unmodified
  mac80211 and without my earlier patch.

What I concluded from the code, without confirming every step on the
device:

1. My reading of 0x738f09fa is Supported Channel Width Set 2 with
   Extended NSS BW Support 1. As I read Table 9-272, that combination
   isn't defined, which would fit iw printing "reserved".
   ath11k_create_vht_cap() copies the firmware's value unchanged.

2. ath11k sets SUPPORTS_VHT_EXT_NSS_BW and
   IEEE80211_VHT_EXT_NSS_BW_CAPABLE only when the firmware reports an
   NSS ratio. "extended NSS: not supported" suggests this firmware
   doesn't. I didn't print nss_ratio_enabled itself.

3. hostapd_eid_vht_operation() moves the 160 MHz centre to CCFS2 when
   the driver's capabilities include Extended NSS BW Support. That
   would explain the beacon above. I didn't capture a beacon after the
   change, so I'm assuming it now uses CCFS1 because the AP transmits
   at 160 MHz.

4. ieee80211_calc_ap_he_and_lower() reads only CCFS1, so the AP limits
   every station to 80 MHz. Since the hardware doesn't claim extended
   NSS support, this looks correct to me, and my patch was the wrong
   fix.

The change I tested clears IEEE80211_VHT_CAP_EXT_NSS_BW_MASK in
ath11k_create_vht_cap() when the firmware gives no NSS ratio.

Questions where I may still be wrong:

- Is ath11k the right place for this? Or should mac80211 or hostapd
  ignore Extended NSS BW Support in the capabilities when the driver
  doesn't set SUPPORTS_VHT_EXT_NSS_BW?

- I also tried applying CCFS2 per station (only for STAs that set
  Extended NSS BW Capable). On this hardware it changed nothing: both
  clients stayed at 80 MHz. As far as I can tell, that's because
  mac80211 clears that bit for every station when the driver lacks
  SUPPORTS_VHT_EXT_NSS_BW. On hardware that does support it, an AP
  that signals 160 MHz through CCFS2 would still be limited to 80 MHz
  by ieee80211_calc_ap_he_and_lower(). Is that expected, or is it
  handled somewhere I missed?

If the ath11k change looks right to you, I'll send it to the ath11k
list. I can also capture the beacon after the change, or print the
firmware's NSS ratio, if that would help.

John
