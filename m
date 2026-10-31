Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793476512;
	b=zLIfeq2WmroaYQPs6QKigvdwx1Vznvox/3Ae8jFyqFccbCjj5o/srS8g7PwE5TO5KfAY
	 GkBnJjoBmGtVVaa1u1/QeOIsNAiKPpdKAmdoVrTvxqJH2uiirHPvBIshPaDpGyFe3MMQC
	 rcWGeNTHHlCVzXkLOt+GZdZca9DqoGOP10S0wbLDhALpFMeLvJ1OGr8Em/KyAdvCyX0pP
	 tggP3c6Jftd6Cr6oS3cVK5Vca/0MveVIkTyusRmn4zE9cpQb2s48cll8URxWQYw+DMctY
	 VeeSInSrO8z/a9hOxUTCmVlPvt6gcB/oyB5t6czDWwuD1SbOugyp/7bI8U5KZrPqF1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793476512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=5O5IADadRA7OjjYl6cdAuBGkPA4cHFlxrAeTL7mxKBk=;
	b=sUAoOy7K4673kmtBO7JCrb+Ku4wIja353MHlazaSwLnHBXzT6BhZcU/lxeDOsQyjBQ2t
	 V6NfkPFg2OppOiAMQfFN/3opznCAnSnjhBIOhPoPwntEHMQuWhTDs7dZJIaHx4eFofp+M
	 be90K9fs1yQS5Q371h/zG9yUT6tu5djYjmP61UW2sYndH1rGBMZsodlRJuTiZoQ94HfAn
	 f1FimbRyDm4kGqv9imZvphN9tcLy+V5KTiRYC1yWHbRpJd6moEmJI5YR3UVY176c+CG2u
	 UoYK9WP/y8qwdTRZO9daa3bsI2xAkrZZkXHrAYOeXRnCmWzxituOq/iCph5uDZhZj+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5F4606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 19:55:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C5F4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8ac8a2ac52bso20510747b3.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 12:55:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793476511; cv=none;
        d=google.com; s=arc-20260327;
        b=WcIfMnhr+DeNz1RFJA4/wNB7jXrKFhFww3OeyL0ObhsOG2RnJ6tngADPtCEfSXa0QS
         8ZX0ai1RAawZZrysohwGzvwc0Y9Jr5PMzDdccwz0TnT7/dyYs8nLmhynIsPe9lV7IZU8
         cJQYwI5FoHtTIX9BEhl1swK1UWfsBVYE+oXBtxSzTjcGKl2phz2q5OZ52X+RqyGF+YEp
         qt+6yJwib1QYAR1MXtf+BVsO2SOhnTsboNMG8HDoDFfSqm26ngZaaX72qNY6tS7F3Nv0
         yMA0/IuJTTARe6O0Kun9kyvlTprtzPfpdBqR2z5PeCgFXTcRsoX1ihJAEmE6G1446Vyn
         4IWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5O5IADadRA7OjjYl6cdAuBGkPA4cHFlxrAeTL7mxKBk=;
        fh=E0jYQdVjYNTksfSb33pPnNWONYa2EpMFoA8pnU4UveM=;
        b=BHnuUSe/Z/64X8gR0ItZt4YkDL30ZBSsCo5m6xSdR8CjI5uZz7iU+6cZb1P/Wf9vT7
         daN6vKD6prd+nfUm7OaFBT/iKh51ekA+D0WoxI0LWEKJj0R9nuOS0IaXaTRV+TPJCgAs
         WUqUe1T5H4kjlM3WbCGyeQCfMNgVrqR1ncNyifnk+jiwpgszSNI2GCan6IN5iB6CWMH6
         D30AaAlb/zlkrKJnrYCKhixsVJ8jydLJOg4TZpVKbFplDcX2Q7n3BDsf7NE/p1/Lug+J
         Xu8SuU5mqDbfnNfGMYfvxAQ8HV+iDE9V0kaYG+SSHQT9htfeK3Zx4YaH7nnE7m592yGy
         O1jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1793476511; x=1794081311; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5O5IADadRA7OjjYl6cdAuBGkPA4cHFlxrAeTL7mxKBk=;
        b=STiIltO/aqKmnKiUqXHcjXT6P/2qN7QUM0q+/n4EgGThq8OvAxvoQ80ETa9YMtYGjO
         VX2c8EEV7d8VCgCeuPgqP3pbjamibnVJQTW1fOst0t2iouJACwrAHGTKavgV8n1ZK7Lu
         iTte4wR+EAOE0Nh1dOrnv8ZEsXgKYQFvEtWqJHeqbOFOIEFQ4I47jRwdWoTHn+Cb7RWT
         eKgj9UDHraGLjIy/F/ihfoA86jyx7bK6URZkBM/2O7X7mgq/IbwaNx1Wx+Hyj4/aZ27w
         vo+NjOBzJtAdRBAySh7FM6PRRlaltQWSPh10UxMdqDRaH04TyoJVhfV4CKGgv/Zs6yzE
         /Sxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793476511; x=1794081311;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5O5IADadRA7OjjYl6cdAuBGkPA4cHFlxrAeTL7mxKBk=;
        b=MezFGf4uvvJXa3W+S6EYq60PaAecy0XqDuVRjywQNRTfojwSgaFFvwmqX4SjoVVH8G
         jSglSWPSXYIVJiQxtPG6TwbpPDtf6F5W8+34XK2GLyDzcGk+ie2km0QUI4l2TJP0R9JF
         kXFqgmMQajgbmBEwKfKWhDNSI45hOkvpSZrnhC/fjlof15l7yq13Sw5v50p1kgDpSoJk
         BpIL9Q4u5zO9J8MXlCY+77CrDK8M+3DW2WjNVfmpecrtT4zCJTKFxzD5HEm9h8wSE7xf
         PC7dYEp1IH5exxuTCL3CrMYRTkADjrfdWqKvyd6tziR/IPJyXEv8n+uaMNrpXfZawXhE
         MufA==
X-Forwarded-Encrypted: i=1; AKwUvBzX79a3SGucKUqxERNGsbCwQbu24HSaN+jK+ftmQBQA/I9NMg3nLzKiFic3Ti/aZ+LFXL2JQGKQHtHI9AQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RwxOoQ9pek+rJn+t/lDuC+vbRg7fGcEy8zE1qbzc2gwZ1qaqf
	snUm7s10nbhmdcCFEtJFq5udqPwhImDhFbB7PnEffqVhQxmr/9ZIbMwIVMF5Kb/am8Orf+hGtrl
	SvaXqcwfVRTDd9mIdkHag31tV0oqgsgJpdxokV/VT
X-Gm-Gg: AYBFou1zmFwEYuFaVTFQyXpGPgz6+Bl0ygFBkPwVKt6tz2iTTDMTRYfStbEK2+4SDEg
	+4/CyeU/Lne4Ey2DPXN8eMxW63Gi7fFq3msinFzs8/KqUko1cv3GuutR6IjKPTZFLKiTDzoyX50
	aKtrSryGb0adQPKtBBzj1GWLoTtCGl0jcwOrgFpPMWcFejpkPr4Rj+ah3gtISUB9TLat7OwNytU
	o8TfUMu/XCht2iBQ+tAdofV97yA78lFmSEXqv9TiT8JYb3BCNT8DWjaVeeTuWO1N6Ag3AqcgSHh
	TUAd+jDTgk0+o/OEuGyPrOJaUi4RD6jALQMmWkVG2Igqm1AfJiXFssotZzHXrJtc4RPg+0mrUje
	RKcIVUpG8KAa1TUdLub0kHMun3n2rbv0JB//zdAVl1sx8qPvff+64L4qcw5189WiurYTmF609nd
	Lb3qZpeouGUREc3+aAMvMRfARFwParohkcVo+jFK2BnvIE5YBftuZkKngi8r2SN+FTYUBeJyKxl
	ysjqxtTSxDbvZDO3v85iOrJa9wZDFa35XX4Xv4Z9wAkxqT3KxuiN3bjbVBxR4ro1NbSagwSguVK
	KDYuCtg6gaI+xNsgqCW6fTyUDXxrXEZsEDjVpZWD450mtXSJpy2BYEWWG85uYCGCpmg5hdVJYQv
	L23kr4Z04eUOGj4QmkGHCdKtKf9zyTg==
X-Received: by 2002:a05:690c:6612:b0:8b1:6c4d:6b83 with SMTP id
 00721157ae682-8b1c6762363mr64199007b3.24.1793476510987; Sat, 31 Oct 2026
 12:55:10 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027075544.19144-1-julius@bairaktaris.de> <20261027075544.19144-4-julius@bairaktaris.de>
 <7ecbb748-85fd-4a5b-b673-3f29b683e8af@oss.qualcomm.com>
In-Reply-To: <7ecbb748-85fd-4a5b-b673-3f29b683e8af@oss.qualcomm.com>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Sat, 31 Oct 2026 19:54:35 +0000
X-Gm-Features: AclHuK-y6ZcuKV4f5uzsmB8CJRCLAxncnpWnV8eG7gDPJlWCxU7zg7ukuzbMPBc
Message-ID: <CAC1t37K+SCBFbt03xWrdgreaWctwx5G7uEYfyjRHghztKaWR5w@mail.gmail.com>
Subject: Re: [PATCH ath-next 3/3] wifi: ath11k: add a module parameter to
 select the hardware mode
To: jeff.johnson@oss.qualcomm.com
Cc: jjohnson@kernel.org, ath11k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	baochen.qiang@oss.qualcomm.com, strst.gs@gmail.com
Content-Type: text/plain; charset="UTF-8"

On 10/28/2026 12:03 PM, Jeff Johnson wrote:
> Is there a different way?
> Adding new module params is frowned upon.
> https://www.google.com/url?q=https://msgid.link/6d553cffcb0ae84e141006ae1430f6f37909ad2b.camel@sipsolutions.net&source=gmail&ust=1793562736182000&sa=E

Yes. Which mode the NBG7815 should run is a property of the board: Zyxel
specifies it with one 8x8 5 GHz radio and 160 MHz [1], and its board
data makes the firmware advertise DBS for that. ath11k can then pick the
mode from the machine compatible, the way
ath11k_core_usecase_firmware_table[] picks the firmware for WCN6855
boards since commit c386a2b10689 ("wifi: ath11k: add usecase firmware
handling based on device compatible").

For v2 I would replace 3/3 with a table of hw_rev, compatible and hw
mode, with one entry:

{ ATH11K_HW_IPQ8074, "zyxel,nbg7815", WMI_HOST_HW_MODE_DBS },

ath11k_wmi_tlv_hw_mode_caps() takes that mode if the firmware advertises
it and otherwise keeps today's choice. No parameter and no new binding.
1/3 and 2/3 stay as they are.

A property on the wifi node would describe configuration rather than
hardware, and the series above deprecated firmware-name in favour of
the table. A runtime switch does not fit either: the mode goes to the
firmware in WMI_INIT_CMDID and fixes the number of radios ath11k
registers, one ieee80211_hw each, so changing it means a firmware
restart and a new set of wiphys.

Does that work for you?

[1] https://download.zyxel.com/Armor_G5_(NBG7815)/datasheet/Armor%20G5%20(NBG7815)_4.pdf
