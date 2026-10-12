Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E474AA417
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791822459; cv=none; b=sBjKNKye/ilIxonKgg4CBf4l+TkTNBJv/pgz5rBG3RsP8OrsTkscN961JN/CZ93zUEfkqYRasD4pl0O3HpGLwTP9G1IDWUknA5dcmXUQoBp1jiaFPHiAn3vVDkzcquTbTDrLYEvQ2f4t4Ht3vAJge4i7NT5CcP27vBtDx2ABj/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791822459; c=relaxed/simple;
	bh=zkr7WBLDtC/RyKdHb7CW1HYyZlDD08zJ7+NVgznsRRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ktYDV6Q4uGUKj89WDqt0R0c10YBYi2tB3/zu9Mc3fuC2pNwJdR7sd90fW/KSJGgYsw2qVjLDOH8Ik49VxtzAv5rFFQu9bxnSVzD3sd51fjJWcqKnoF1HW62UT/sLd4oQour5xQMbVxwbAfGf5xmsqk453f7HiMqpwqlq9vnsCBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YHjqDrFq; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YHjqDrFq"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b0d19cf7eso2800200f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791822456; x=1792427256; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TDpwaJ1oRpLE3raEQoNefoSEla8kJ3ERyibh0Mx62mQ=;
        b=YHjqDrFqSGu0z6XIUgO+ztW/RrPOJpNK9Nx0iErM2UyWW2ya4uPc8aP/KH8nRYNgOR
         scXkREAWp8KA15DW8mdEDz568GRm//RzX3lSXiY8XGYh8s4lgwfSjKwAJ05WjqmbJifG
         tG2LOmEU2dagwXSSSF6hV4Lp/UHrj2PuGqvddV9H4GL1gnolHrp/T280vSs3U8KcKlPi
         mP3yP7cr7Rj0YOrTBIcdBD1CYu3u0phQmaJykb0dDHFgURNQ11WElhug9cUkX3lrD6+T
         QlX02IMv1YRngaHRH64aIGEuh0sYB1m4STdwE+wZJdTN7Q2TJRa1lRD2NMuy3WDvdzfR
         BF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791822456; x=1792427256;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TDpwaJ1oRpLE3raEQoNefoSEla8kJ3ERyibh0Mx62mQ=;
        b=C0LahAkW+UPWzq07MXihHDGQhWyQZ1Ni+g2az5OVWOB0+IxD/85pf7flCpigyUyXjr
         faZAt2H5WCshr/2Xb+UzeoYxt+XTOCysfY1NrI2yae0azomJb2t3zY1cHKPqs+PDkloG
         JkuQ5KiGPE1R0XffOy7/ZYFc5C3qLP+EbKdWoGtLr/Yntd16gd9r/nCoGmOaOmTBFNLb
         7nLcOCWK4tIfQfGw3ObdoTIa7Te7DblmHJ4BHfUwNuakl1IJUabMt6HuEyP+xf3v2ClU
         5r2qttNCD3c8+Tr8esUoiZTFor7NfwR2LuFUdXLxrl54kRKob5oGf9isyGY/BJx7dde5
         12AA==
X-Forwarded-Encrypted: i=1; AKwUvBxHyO9dcspQHfPpMXK9lN+CpWXG1PiEWylhrdXruwaO0joijb/NaBfvS7tFF6oWn+qZi3YMwHNMEtLPn4s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJt6REJt/elO7ziwTALKLTiS7U99j0mBKtIn6208fObShfAh97
	ZHzy83p5L0uNmu/DsBmP9Q4M38OuTYMVX4ulepjiuS3pINrTdqaf0CZH
X-Gm-Gg: AYBFou3n4s20O2MR4DO4lFDXts95C9iHuoM0/sa8MLgmXGra9DM3Q2Fj7AolM2fdX49
	JCdEX4Kr4rtf6TTpLp+9mYzxxSt5vsshPqE7axH2KUomWG3JvQSrrYdBUMm74SMvY209n9ifQt9
	gxQCYPwagZiRtYVGIyuys8eIClwdBV4knVj0kd3Uom9+5+qtKR0kUpLtR3d4EkzsnxLrYRllTxQ
	nM7MTb2X0+uAEXuPYr3tJLi9O/0LLE0T210EChoqiFdIUYFOcipq4J7mq5nuILCHO6mze+w7nzJ
	+xxDOpzstPL2zwGzKKR/P5eBd0I68hwSYIyFC/K7DXoLJzKE669bBGmYUKKhJLq7naql77Y3pBg
	oILHyXJyQFP9F5fcIcTveuZMjUnVotfAc8pFFuyqefekhBUC0tbv23+x5MaOni8m8ILozoMDV95
	IQCJ19ncfMPPPqI8f/WqqarvF+y7PGAQR0B8Qhj6fHxj6JJtcfvrF48NaWl+OkxSUo3gXyJSfuS
	tDtnGDJsGJmIChBTKv8PJW5qwkG9/KuEZHZsWnGk7VP+WXh3onXPz4W90iZ3Jdnd8VEQUDVBIgt
	xu17OBsVIvsmucEnbb6cbmzon3RnVvqc7ddw7qlJ3VsofAg=
X-Received: by 2002:a05:600c:16ca:b0:4a1:877b:d4e0 with SMTP id 5b1f17b1804b1-4a18dcc911fmr134708325e9.12.1791822456134;
        Mon, 12 Oct 2026 09:27:36 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f2a:fd00:f5c8:7592:9084:dba1? (p200300ea8f2afd00f5c875929084dba1.dip0.t-ipconnect.de. [2003:ea:8f2a:fd00:f5c8:7592:9084:dba1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc506asm260781f8f.47.2026.10.12.09.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 09:27:35 -0700 (PDT)
Message-ID: <cb3a1207-53bd-4488-a1fd-88b1f61ff0a8@gmail.com>
Date: Mon, 12 Oct 2026 18:27:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] r8169: allow Giga Lite fallback on RTL8168EP
To: Hee-Suk Kim <hskim@dilluti0n.com>, Daniel Golle <daniel@makrotopia.org>,
 Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, javen <javen_xu@realsil.com.cn>,
 nic_swsd@realtek.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org
References: <20261010135356.85454-1-hskim@dilluti0n.com>
 <dbdd5abd-f1b1-443c-adc3-6ecdc95f4854@gmail.com>
 <4435b286-1638-464a-821c-f486b647c9f7@lunn.ch>
 <aszgerrI8yoLTaX0@makrotopia.org> <874ierc6nb.fsf@gmail.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <874ierc6nb.fsf@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.10.2026 16:53, Hee-Suk Kim wrote:
> Daniel Golle <daniel@makrotopia.org> writes:
> 
>> On Mon, Oct 12, 2026 at 02:46:27PM +0200, Andrew Lunn wrote:
>>> Please add ETHTOOL_LINK_MODE_500baseT2_Full. Make the PHY report this
>>> link mode in it features, add the speed, allow it to be negotiated,
>>> reported in ethtool etc.
> 
> Will do in v2.
> 
>> While at it also consider ETHTOOL_LINK_MODE_1000baseT2_Full which is
>> supported as "2.5G Lite" by the RTL8221/RTL8226 2.5G PHY family.
> 
> Happy to add it as well, but I'd need to know what PHYSR reports for a
> 2.5G Lite link on those PHYs, as I can't test it myself. Do you happen
> to know?
> 
Also the needed register configuration may be different. Would be helpful to get advise
from Javen/Realtek on:
- Which lite modes exist?
- Which chip versions support which lite modes?
- What is the needed configuration per lite mode (according to vendor drivers the config may
  be different per advertised speeds)

I can't tell as I have no access to Realtek documentation.

> Thanks,
> hsk

