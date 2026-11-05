Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793885819;
	b=soIfuWb6K3U7Het8PW2zDvrLD9UbNGsONyS84WY9aqmthYYiubQWP2Gkng8mU9khofn8
	 6asuj9y6mvXU8sla1l1ux8hD8zuuEtmm2WxAhZpG9AxtxOxaXAtr4vSWMV3opiROjXZJr
	 LxQcz/EA0qAVrAL+W4IikbO2FZeuR8n+JMiugAqgWoz9XGBbeBpwEnWbtBvBMIM4K6OY9
	 ptJ/eZUq0LTCp9s1sQG/3FaDxeoTih9L7I7cDRFhojFR+rep4+Stxf4Dv8G+MZUg5T5zj
	 LhbaB1dPdFHsh2k2uhtXtLCyOvG07ZlBp6i6qipV/x5A5/AqShN0k4ZnfHs45ERz7DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793885819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=WBQ4YMiVBBvbebUf4Eh89Rb7fq5fgRCv2V9oWSzYxO8=;
	b=BnC2BVpL9R93zb/Pg2+oyXpQQaJ4mUYFaD5P7t7j9uJvVO32ZdNDL3vR03iJW357EneS
	 +ZHApiFB5hxb+mQ0x0JlymdbZurh5SrGHvg/Odbb7Oc/e/UXm/VeckQTQ0XE3sAUo/Ilt
	 8FQ6A3usBLiCTLGCpzlWjwg0QdiFubBZaTltc4JTEXvIto7q+INX18qmDkWafqf7eT+XP
	 BUI/9D2upQVk/nFnhs8r1Y47RysYcENoAcCkO93meGgM100kfLOkqkDy0AikEUO/Z5eAW
	 K4xoGDhOGEg1j7YudjYmw/KchO5w51M/b3z7+0pw8bOKSdVn7ohv/F/R41vjesW4GkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=h7OvB6cb;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7996F606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7996F606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=h7OvB6cb
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso3280923c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793885818; x=1794490618; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WBQ4YMiVBBvbebUf4Eh89Rb7fq5fgRCv2V9oWSzYxO8=;
        b=h7OvB6cbdwWpUtNAzInh7lFfuc5uorsA9FZKRZiOPz3lRCB/Qt0tGv2s9RiWDwtjIm
         lW2njz/y/dEBfep6J17Y1jBp2gnnWz6P9K5Bln7XWHR6rN40i+cu9VKUqZEHx7tBrWU5
         +yiOUhcZ9PAoTHrNJTYwLZihvG268p/9T+UyJJkDxfdF1IyxZir2sisNp/rAjAyVbWiH
         D4R5G82m8PJqhvfK6irr4wy3LLY9tAnxZZMObJNBqiGpo65dwZtFOTh2avKivHB0wcs8
         sGaNyPbKHH8TPKM6uredKgw/LYK2/6pNXvfjYqVCcdQMbOmW3i0c3nGI88kiTZVKUFk/
         NiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885818; x=1794490618;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WBQ4YMiVBBvbebUf4Eh89Rb7fq5fgRCv2V9oWSzYxO8=;
        b=j2T74AUJwFK+8Tr22M4aGXMmc/pWnM1N94bpYt+lPwoMJGiQCxz1hP7CHTKb4d0OMr
         tbCCVgsHgyzDnVc30F2/Tzkuqys3GGJ59Zh/peuVKuVwenRE/oGdascpaE9bpxV5FWDh
         Virg/fxeF3VPETFkrXtfdThxro6vCx8JUawyVhBfImoIJGj0oFpmzjPpLal+rYPC2Fyd
         y9NfmdUVD7qjljxTNqfUDkVFXF2QbXPGf8aSL/WEhBS/X1L1LUP/F5NPH/+H3zp3eiKO
         zdlA/3O8AADR11zQxocM1PozF+Lf8rMxd3WO5Wz46XOSpXiRxzO0hpkzfV18MAq3Fcsr
         dueg==
X-Forwarded-Encrypted: i=1; AKwUvBzA7NV/BSwPxPaegzDRviyM920aezYkfhHIogIkuEXtxJDpw+BNa4cMeF/5FQWd5UeYRmyJ2pIk41+qhaQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z85lnWRaRhlVtfdxoHX+ftBMpc8jwoeuLF7bMtarDmkj3q9YRnq
	Ym4MIVTNDYlvKMMxdkdomFLDoEnIGD85bhNSBEk5GFbycxezVPdNq6yhpRxZos5wokcXz03Thaz
	GVF14Y23vNS4H/GusDBfaT8b99DiVUg==
X-Received: from dlbvv4.prod.google.com ([2002:a05:7022:5f04:b0:1b2:41fa:646b])
 (user=chriswiseman job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:455a:10b0:1b2:42ae:94fb with SMTP id a92af1059eb24-1b242ae963dmr9575010c88.37.1793885818098;
 Thu, 05 Nov 2026 05:36:58 -0800 (PST)
Date: Thu, 05 Nov 2026 13:36:57 GMT
In-Reply-To: <auwOBaRtM9p_Wxfx@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <47ed45b5-de67-41aa-aa21-a3ba3479a7cc@vivo.com>
 <anXJ-5_vO7-toSe1@google.com> <CAKEwX=Mm2tXcen-quRXHf1Y2qSHYvpEUe4xiw-mHYaJnRUR-EA@mail.gmail.com>
 <auKqt6b4AxCLziIH@google.com> <aufPMirl4cD7tz0X@google.com>
 <18e4542967ebdd10.3137322e32332e3235332e313736.1dfc41.0000sendgmr@google.com>
 <CAKEwX=MV_xEUvz91pz6uc4qXWnWOUDtXZ2zASdNVOBHBLeA60w@mail.gmail.com>
 <18e4ebf806e937ec.3137322e32332e3235332e313736.1bf52a.0000sendgmr@google.com>
 <CAKEwX=PFdgEbba+H3fEnJFDnfkxCTsvuHEb4numVwJRaiMgwKQ@mail.gmail.com>
 <179384102494.19062.12740032892044628762.b4-reply@b4> <auwOBaRtM9p_Wxfx@google.com>
Message-ID: <18e529a5ab0738f7.3137322e32332e3235332e313736.873cb.0000sendgmr@google.com>
Subject: Re: [RFC PATCH 0/2] mm: zsmalloc: make shrinker compaction budget-aware
From: Chris Wiseman <chriswiseman@google.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Xueyuan Chen <xueyuan.chen21@gmail.com>, Nhat Pham <nphamcs@gmail.com>, 
	Xueyuan Chen <xueyuan.chen@vivo.com>, Barry Song <baohua@kernel.org>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Brian Geffon <bgeffon@google.com>, Minchan Kim <minchan@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Chris Wiseman <chriswiseman@google.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 4, 2026 at 9:05 PM Sergey Senozhatsky <senozhatsky@chromium.org> wrote:
>
> On (26/11/05 09:10), Xueyuan Chen wrote:
> [..]
> > > SGTM, but I'll let Sergey chime in!
> >
> > Thanks, Nhat and Chris, for the discussion.
> >
> > If Sergey has no objections, I'd be happy to send a follow-up series
> > to make the shrinker configurable and add the unlocked pre-check as
> > Nhat suggested.
>
> Thanks.  Sounds like you and Chris will to have "Rock-Paper-Scissors"
> to determine who sends a oatch ;)  Just joking, let's first figure
> out how exactly we want that zsmalloc-shrinker thing to behave wrt
> zswap expectations.

Haha, Xueyuan is welcome to send the patches!

Dumb question on the zswap side - aren't the zswap shrinker and the
zsmalloc shrinker independent?  Even if zswap's shrinker is turned off
at runtime, normal swap-ins still free slots and leave fragmentation
behind, and unlike zram, zswap doesn't have a manual sysfs compact knob.
Would it be simpler to just keep CONFIG_ZSMALLOC_SHRINKER as its own
standalone config rather than tying it to zswap's runtime knob?
