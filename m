Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794785064;
	b=Yck0ImQjapAgJHqZT6W+FaBjIQRCJ/EqFrDMTyI0fahXjdft8VHJEzqz2ccWC7gAryuu
	 ks+/91IA5CAB7pWJOfCCK+64smmShdnwga4LcldZb7q02FLiptMP55Gwdv1MSw7rzfnQn
	 Bggt8Bn25j6TeF6v5ndR4118+5KFHQOsZx3XOhsglnHb54FRZMTSQF2qCQEeg/GGpIXDN
	 A3hl7lFo3K3Q4H3E/re3u6m8/RPoZgC07trBRqDxlK3m5gjlE2GvhmQcyNOrkvVgw2aHK
	 eLZ8vPtnwy/UUMqJB3FUC2bhVQ7Q/QyDiexm5cnV0eVyfJofW26AsTvZQlR1u5jdgAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794785064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=+/Z4L9oHVW0yiRbluEN2fpODjMHQCBt/wYZxCW702Rw=;
	b=nTW6uLBp1Ocu9J14AN/fr4I2DCfjlDJvhbACMjyVHzExC8NrqqYcQbghEXcGXBi3taqY
	 zcRfORah16VijuZTNTd0DmZqF/FXIRcPaQCuz6IH34WLTobPiaI/0gNo2lF3/SOrfuys4
	 1XxfXYadkb7jk4Mro4ubtyyOpYbHMGPlBNpUCs3wMHu2zOpnXGxzvfNjABHi//GG1Ai+O
	 ygJGCRyRuEOZ66fYg3P3mnhyMbzw9qvNz4kU/9yaUBR+VNpR1HNqjnxwhKKm5FsL6WvZG
	 4Pj6CcNjYbDXxUQZXX01I0GMsEW6hmH5GXAENrchgEFxkw66HFOX12HK1NnXwf4pJhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=k-tech.co.jp;
	spf=pass smtp.mailfrom=k-tech.co.jp;
	dkim=pass header.d=k-tech.co.jp header.i=@k-tech.co.jp header.a=rsa-sha256 header.s=google header.b=R4Xmh2mw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3638606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:24:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3638606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=k-tech.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=k-tech.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=k-tech.co.jp header.i=@k-tech.co.jp header.a=rsa-sha256 header.s=google header.b=R4Xmh2mw
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so4136219e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:24:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794785057; cv=none;
        d=google.com; s=arc-20260327;
        b=GkY1B7KiPh7zDjUhn2ndsiVhsYLaplNmeEIeRJsJKL1Y7dlSpoDHluvQ3xFPc+LXVp
         P1lgfP9bXkHlTxITaRNyPhwOvwGOxLKBXhtWDZuW972zG42oqwJUZ7e//KbUuZBK4toZ
         +MUjw6NM97oOZY2BOjIHnj+yNrdKI4pNLg2NHVRikJ99JsMsrRfPt0k2ck5IQFbxMo4W
         SC83wQoUz60Vr4aJX+D2pPa11UMKd/KqY0EBbm2XdhbJrrH9YHlHzdamd5WgpL58P7EU
         eEn1SP4I+WlLDeQ2baC3f/ON0gCu8s5rmbY1SMuoYzrxbnMSobt37q2VNO2ICe/EnZGF
         womQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+/Z4L9oHVW0yiRbluEN2fpODjMHQCBt/wYZxCW702Rw=;
        fh=MveQjDo/fE1HvhErYhysNgHj0yb1mQnqFMBvv0rmodg=;
        b=mS+vwhq5F4dzWNbura9Hs/wprQ9T/E5Wh8NDyuK/pOSrAcNxhHzWdo+vQiw1lsg7EV
         WphCFvdakWQ1UvoH9qkmk00iu4G8k45RpBEyuRXtaBDEQouENnPxg7/pgRvAd0PaksC5
         SKHCLuwFlPfC3+JHJ6im1/yDq4a4y5ZkZ3+dg4moD+IMsGoxykTTKYIQvKXhfCa6RbRi
         hA+zepXgWJmrjzj1ljv/5fOKD+sqE9zxcbn/SpH/7xrPjMYWSqe45ka5kCWEBnSgfOwT
         GIC6ny/4xPsOkveMarNsf0Cd+vqoDw9QrcKb+HUv3OmRkcuIakeG0ZaO66QQD2L5bl9B
         mcIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=k-tech.co.jp; s=google; t=1794785057; x=1795389857; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+/Z4L9oHVW0yiRbluEN2fpODjMHQCBt/wYZxCW702Rw=;
        b=R4Xmh2mwXLsPCOaJD8TW7ya7EtAVRGAaQIG5L3wZG7XdQW+qhsrN5zBWRhdhBktZne
         awo7HfP9rtfuGqN0RtshAvP5AAVtSRFPbN4OxYTAVrIWiIiXPHFCtgU+wN8/4pobBYUM
         nFyIfIYy4AJ8VbkbedE3IhZyc3WL8mdyP2u6r6w21KfHMJpKJk/5qMWeFV9EcQfCoMeM
         VwzEa4ZE72D4dbYkoDRjPqVr+izUivDRp0TueTZOZUetXUMJYpDdeieFfzOZ9U/qBM/h
         Q9GA3i/zmbvw1E6xwQMDQ6jtGzub270bUq5urqk3w9aEbCaOZLIrtX+L2R3i2q0eAlYc
         HuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794785057; x=1795389857;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+/Z4L9oHVW0yiRbluEN2fpODjMHQCBt/wYZxCW702Rw=;
        b=u5gaZmw/WFmsd3yHgiiq/mr5+zrcpUdlVEbYi/vwB4sgxUNKhjR92x3+ft+up/Uk5B
         dXzdyHzcTRr3x4opP7K7nI7yEd9FPO2AvtncEos1STSLtA4GfmL3HxBBpA3I6CZx2qfB
         HrSjHBQrK2fi2r2OQsRuJYXNRezpbKMovEcypcCH7OEu9HFgtIb9txXZltb0XSvAIi5K
         Vl7beBT0MxBqbwmARFlTis4fpqW4PMq9Z7ZMnqkR5F/0U/zJYkJX5KL1T198Ankh8Opk
         6sDySPkMccVkWMNIKG9SsXwvD0BzPJg+hsErTEQv4VSL1x/I+welh8pPdTDrY3X/reTH
         lo7w==
X-Forwarded-Encrypted: i=1; AL+hErEdMaIOkOU4sk6ozHPNTHWp7pH9ts9geafGhbIcGNePNIz1KKPWLvwMWnMOl2YOOODLaR6Khnmt7XlKzHM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iQN2sIqlwQt8O8r/Y9O5eR0IVkt3K/lGDdC2cRuqcR3J7N2I/
	43n4y9fhwjBTlba8ZCneE0mxF3pAo4N3nqFX2AfWQWid2JF1+4e9g1o/gUfPXJsANYO/+J/Vk7L
	wdDUoC3nc03FwYbnOiszO774sxeQ+rbZD4inJaWlCF+7PqGDndZYrxdmjyg==
X-Gm-Gg: AYBFou1nRCDmihdCgnprC7RBce1IDIvd/JrmV4eS85mYT7mVKuU/XL27kleMdkZThbW
	NYBZUBobuT5rwShjUMTRA/AzSKNfFBdefucKXspAGRlzmNbBc1Wh5QPy1MqX+ktZ6DKmch8IVyF
	vFpcYDXx8skEYbA4WFc+A+Fgu7awjXllyBI25UgHnpfde0iqbSWypH6e/uXyDnH/Ko00y9XMeWr
	wv4xxzx/MzMNi/i8/cXssbRRl86rC5JmHt2AiEYpQ/9AU8p7GFvBCzV923/hdnkhFznrqCyVwiO
	3wShXUdFZIg2WOT6zX2IN8rhAjzJSAsBT+01tZ/dvyQAPTxvV9pgbDP0M1BOmm6idWwkiqrPIZH
	7QvKmcqUFupRlFUuIxbesKbEiMMpyanIfml9UJfRO7PfJLPtOv9yp5C1J7/VMsxzC0qU=
X-Received: by 2002:a05:6512:3c8d:b0:5c0:bca:77cd with SMTP id
 2adb3069b0e04-5c1709e0f4bmr3285081e87.42.1794785056172; Sun, 15 Nov 2026
 15:24:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113033833.124797-1-goto@k-tech.co.jp> <avb1CyLqJGI_MtXv@gmail.com>
In-Reply-To: <avb1CyLqJGI_MtXv@gmail.com>
From: Yuichiro Goto <goto@k-tech.co.jp>
Date: Mon, 16 Nov 2026 08:24:02 +0900
X-Gm-Features: AclHuK9TcUvv-xb8BW0WisisJi7QnpM6fvoiPZapBIoaiw0rO_faqX91PXWLlCk
Message-ID: <CAFn2DuFZFtgsjD-TTrK5x-C43sE328Pi5hoxOCvzcKoM0DpWCQ@mail.gmail.com>
Subject: Re: [PATCH] configfs: wait for pending RCU callbacks on module exit
To: Breno Leitao <leitao@debian.org>
Cc: a.hindborg@kernel.org, viro@zeniv.linux.org.uk, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Breno,

On Fri, Nov 13, 2026 at 8:33 PM Breno Leitao <leitao@debian.org> wrote:
> Is this still the case on mainline? Since commit 3bc999d944b3 ("mm/slab:
> introduce kfree_rcu_nolock()") in v7.3, kmem_cache_destroy() calls
> rcu_barrier() unconditionally, and configfs_exit() already reaches it:
>
> configfs_exit()
>         kmem_cache_destroy(configfs_dir_cachep)
>                 kvfree_rcu_barrier_on_cache()
>                         rcu_barrier()
>
> so the pending configfs_free_inode() calls finish before configfs_exit()
> returns.

You are right, thanks for pointing it out. I reproduced the oops on
v6.18.63, which does not have 3bc999d944b3. With that commit,
configfs_exit() already waits for the pending callbacks in
kmem_cache_destroy(), and I confirmed that v7.3-rc2 with
CONFIG_RCU_LAZY=y no longer oopses with the same commands.

So please drop this patch for mainline.

3bc999d944b3 is not a fix and is unlikely to be backported, so the
stable trees that contain e9c03af21cc7 are still affected. I would like
to send the explicit rcu_barrier() to stable instead, referring to
3bc999d944b3 as the upstream equivalent. Does that sound reasonable?

Kind regards,
Yuichiro Goto
