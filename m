Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794610429;
	b=lqtcnIueQxJ8e6yDWiHcXSyFOuXIzQNUQxOT0Ph1UCKpmK7I+4YLDOZ8YTJ8qBRwjitV
	 3ob9Nst76X+7QKfpfLuTPUI5k7n5CbAiSVl61F2AH7t3R7P6L4Nd1lgCrTXLsuuRsHKWs
	 w5U4Oujr2/KWANTbkWoYM8gKsWfzSxWeQ7lR59kePcxBr1V4JYpZ8QDe0ElQ6ebaU0aM4
	 WKj9KC3sEoob/SfOWeQ8yKwjBsYj9d8FWu5xK4enqVQ8uwfUqiStt67X+caz9vWzwiIWV
	 eT1C3fGP/ieeW8WKMSN5W95DPD3pj6O2OHLUzwOTW5+4oqwwaZaWo4/F8uo5asoqmEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794610429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=h5U6+VCcHCIbxywmLvk50ZNvHPTQLOr+6P+EbEvWQz4=;
	b=BID7esa7iswdZXGXf1IowLup6Ru4IgtF7OQTF5QobNtnyscSaFR0IVsPt6g1aCgL07k4
	 21uy196NvA/DpBanhzO9o0j7s75xdV7yXdLv+kRFIwnbJ5lxSYGdl2e3ab5XAZx3x3UK1
	 clGrMqT7j8E9r2MNzQxrWSh85E1L7mQpTLoH0S8T2MhjEMcLeHC/Mi5jjkGHCnIGFMdLu
	 gvTpL28HLfaXXGtSRm7X8KZaieFUrj7rQXB0FG1kdtuKw8YWT6Zg+rQCMZZuLlupHBiaN
	 aZyv7VXC5LuGL+ndPslg+wVKyCYcqn18NsgRfTtf7eBcCZNqyxUR9dKuAFCSD1bcXCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JXdYYkg0;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A902606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:53:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A902606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JXdYYkg0
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so88132966b.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794610427; x=1795215227; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h5U6+VCcHCIbxywmLvk50ZNvHPTQLOr+6P+EbEvWQz4=;
        b=JXdYYkg0FZp+OwSHAW9TXTpWiU/q+K1wHoB6YSxNxWTxawJuLOxBGpUghsIyTywRXZ
         Nqg/+WBSGW4ETx8mQiM+HP2e8IGohVAGRAsZasXgr95mcThKUwPIAmgORPl8K3tcr9Po
         8m3GobKYPKzjbLXkZHXCrpGO+OP9xuMUIPD9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794610427; x=1795215227;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h5U6+VCcHCIbxywmLvk50ZNvHPTQLOr+6P+EbEvWQz4=;
        b=NHYtaOuvIizVcf8/9QJ/rfWKwn54dkGDoDyAlVC+Jw0M0zZ9Wjzzg5kTmP6fEqhq3g
         e+e34gIODyIfC13qj8YxabRem7b2YoJDb+qdYZu85+zVZdwlR0bDtsPzRIlj4LVRNyPg
         xAEtXT71ir1T/xti+RDtZqQzW17cFXMYCoJfTcKg72qfmKG4zJXInzQif5hfvLZ0jngJ
         lRnob3pi23nUKsirx2mDBR5G9SjlnwJ6yZFPLaLkTHcIdSjZexFHE1E/03WE3vmQOPNe
         dc7qXLImGjjZfXOEwbfxGP7dgrdtAHsTVjU/EAM6WtW9JHdE27IW+ESnAkuxl+nidP50
         RDlQ==
X-Forwarded-Encrypted: i=1; AL+hErFt38ZOZgzdDBMKrfOq1qOA0p45Kz32Kvb7dNBtAlu/4CnCP+y6K+vjn1B+pQolnoEA9N98BeyuTAkEOr8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9E+ImLtsvaM0kDJ5OIAV2QxFvBNlx3+ELdYjGUbhoaibRONsKq
	oYTqffib638gx+L0/2z64QLCJNGE0m/JBK9nbhwXjvauwwev2g1IT7mafjUVJqctgaXBKG68dY4
	4moqlJQAc
X-Gm-Gg: AYBFou3ehVhx4R2bl0+OeZXhxhbx48yF+I0D/gqQI2QTjbFKVzPZghgzuZaBrDCWnwG
	sIovnLJ29wI8UFpheNRATFHB69BrFbj/y7iFdwxlOZEwVkQPUjOCl/SYHbL/GeabeEFsgsF3NGi
	x0IBf0M+zhiOuqK26jl+xMPuv842z1LSCEjXQmF8rBpUkx8g8p9wnm2Frg9E4m3WSUD7i6GRc0F
	YkGptfDZ8PahuGpOJaj6ENbkCg2CnxY/4dv1ONhzo1tdyiMfP/Vjl8JWs0n6N70Tkr+jDMqgIJA
	ueAQcrFMAoWPzS4b0Y6Qpu7Tr171GneX/fx89h7Ft3bsTmuzW7GIUF43XE8dwaPIAAeBOAvv4Hp
	VQQ63EjZ/yZDWHjuAp6mnRy2YiDmX7jxvqtLFroS7F2OsD6LgyjsgBcKfSwp+hXYFm5PxrYlrGR
	4bLhdyWNsZ+1Z1JuvnQzxQJZoGPd9e01TCNTndMv/hJCft0Vm+M+zY5RlWfmKNkxA6LK6F9hGvm
	E1qp0/mjsNHLlvnXGs1xghYc2rLa4fpBGa7B/fs1kz0C/akjgBPye9op2lNKMfnJvBGlxiVo8HS
	OrNwJsoRcgQ33/OrRd0O2D3BTa1V6sbRa0tUSDJIE2CcvHZq4raT5L3ILPRGFjG7o70M
X-Received: by 2002:a17:907:2d9e:b0:c50:9432:b7e3 with SMTP id a640c23a62f3a-c509640ff64mr354826666b.42.1794610427356;
        Fri, 13 Nov 2026 14:53:47 -0800 (PST)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5b865sm151624866b.6.2026.11.13.14.53.46
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 14:53:46 -0800 (PST)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso9075595e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:53:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG2thwtPX/R4Ac1tkOaUBonVQz52qamA+tpGhfVeOk8TLACkOZZD/aw+Sm7WoCOxyvBtOzbNDtMAiGL+W8=@vger.kernel.org
X-Received: by 2002:a05:600c:b95:b0:4a2:d99:3171 with SMTP id
 5b1f17b1804b1-4bb55aa3688mr87508425e9.23.1794610425607; Fri, 13 Nov 2026
 14:53:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113214526.231324-1-ingo.kubbilun@gmail.com>
In-Reply-To: <20261113214526.231324-1-ingo.kubbilun@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Nov 2026 14:53:34 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V7uw9s3BttHn8uLjxD8mt5=3iYXA8cRzLU=OYFtS65Xw@mail.gmail.com>
X-Gm-Features: AclHuK-RbyOy8ftZMUgl48mYpe4QeeCSa1rdMVaF_Nx5YV_pqN8sAshDCVlegf4
Message-ID: <CAD=FV=V7uw9s3BttHn8uLjxD8mt5=3iYXA8cRzLU=OYFtS65Xw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: add BOE NE160QDM-NX4 (0x0d25)
To: "Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 13, 2026 at 1:45=E2=80=AFPM Ingo A. Kubbilun
<ingo.kubbilun@gmail.com> wrote:
>
> 16" panel of the ASUS Vivobook S16 S3607QA. Without the entry the
> driver warns "Unknown panel BOE 0x0d25, using conservative timings".
>
> Developed with the help of an AI coding assistant (Anthropic Claude),
> which drafted the changes from the Windows ACPI tables, existing device
> trees and test logs; reviewed, built and tested on the device by the
> submitter.
>
> Signed-off-by: Ingo A. Kubbilun <ingo.kubbilun@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Please follow conventions from recent changes to this file and include
the EDID in the commit message.

Please also provide more details about how your AI agent analyzed the
ACPI tables. Did it use the ACPI tables to determine the delays to use
here? Can you have it provide a commit message detailed enough for
someone else to duplicate that effort? ...or did the AI agent just
look at the delays of similar panels?

-Doug
