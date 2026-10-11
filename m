Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC02745DF45
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 19:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791748795; cv=pass; b=kWO8fI4o01QnD7Uz60EIyjxwCg/B4X3vv/IrAvLALVFpR3Q+ybdNBSSyOmKNo5gUDDQXtfmfKpgbdh2azHvBzegDGXFpgLv26exrmVIOpsWbeP64ZP4CwjCDH/7RHWNaHqs7EZBK1yPGU5kUl2lEVWIcBolU4ZJxOmbQ+rDQOXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791748795; c=relaxed/simple;
	bh=ryrryBeSzNyl4j6JyOVJUORD+i+D9ZjkVO8MaoTgdSc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gjhb5Audsav41Z70tDEn60bbbk+1lhV/ffcsLL8R3VZJwX/OlVxqDlSZEJcW7dwtPtpw13g2WVMAkxnoZK7WzMtoihh+CcS5XQE3pB3n8JkzD3Oh8J6ic65yytopM8im0q1laQr1Sd3ZQ+j4x/xIm25pK81JMeIvSIgdBs28Q/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rmOj3y8Z; arc=pass smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rmOj3y8Z"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-90ccb6102a1so17263076d6.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 12:59:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791748793; cv=none;
        d=google.com; s=arc-20260327;
        b=J3g+ju0GJLxvl7iG4GRfdua7oFN9BDMOlckKNG8xZNCKiQu+lMLDPX5tjy+UWrCgFV
         fYO4mS7mlU9rYfRevsxvPMobHgQeBQkIUaTWUF3HIQhZERca/ZL45ZWkNiXiRAk7SFP9
         vmhvRVIFF8edZ+TEY/+J33TWxjEF8+mBvzAg0qqImEl9mJ4/IqBS665a1NTsoGri6/I7
         e7MaPHke4qyITojTBS4VzWFKLNke4HCWgCRuoPpqKheBnIphzDmkUWCkZZssP4dZdOrp
         0teIGGvtTLYHBS8cVHqhgFhJKd9LZ6WQZ5Uxm8EymE8JYTGGq+tNVM+ISRIKRHKAbBuP
         CguQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=egVh2YESSp+Sbik/3sO3kuZxAqecrbk+CD8Ek5NtRAg=;
        fh=AnfKEJUvInCCIJFMnFTRaisv5SfsUNQkk10xTX5GN9E=;
        b=kQlWzEtlPqset8id6ESlBI9J2nApISZE49z/N8ky8Dq+JIFQk2yaHBUSV/GkBsE8Fp
         ZCE67I3EE8uClbT1++1FxT7WAvJhkxbskK81MhDyNAXV1zZTmKeKhnHcbAxgRcvPnuvA
         /04uPPeqhFrjQ1S2zltfIc8soqdxn1i6k+tWxda3vcXbUaGYjCj1kFqMB/pxMql7DxVg
         og853D3cU7XENsjGDu8HVkXAvK02IzuSkodCaRfHzTy6Qt6hZiNV5fM3jmSwOujA4kUo
         aU4hwQP0Og0xhxJI0oCg4fymohi+a+XDJqsh02S1veOwQT0vfs8+X1tmoBRSUpnE6i4O
         C8Yw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791748793; x=1792353593; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=egVh2YESSp+Sbik/3sO3kuZxAqecrbk+CD8Ek5NtRAg=;
        b=rmOj3y8Zxy1iDU8YAahIh748ZavCKBZBuEUAgNvqNac1+KNiGewvM8TxnV/zVoETaB
         tsLv7UXrgMG3rgIkDUgOoWr891rn1RJf/73/K8O4MQvydBQQErs81Vq9xxjOSc5v84CB
         LQTpK4FHp21j01y5/bbq1RNghjvO3rdh7tq32aVzRVoReBQthlAuzWtXdZXU4MXQF7W6
         O6IN7zZzQK3sZPNFmTS+ayjwxdfMQ3r9O/tEjvJIMYpBbE223i1GBAMP7aUhHXWeRmT/
         cAJ4oIUt6NpTSzYwah8kIZ6ZBdXB4ZnIt5VlvCxQwliTQpcc1XuBj0yXlru2cHusHHYB
         Ut+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791748793; x=1792353593;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=egVh2YESSp+Sbik/3sO3kuZxAqecrbk+CD8Ek5NtRAg=;
        b=lcElHwbtOof1PCxP89HYcdYbVATWe11Qt273SjhwX/Cq50VrgIFK65aJ5wVYhfNLOY
         OACOvwbiOOwxyhSE3xIH7o+bTp4EzF/d7nkJFMO8/g3IcUyLgfsRWnnR+XjauzCYWUO7
         Uhj01By8J7qdk6Eeylj1jcR6ExkAaOleWOeCQ9ol2MBikGHKCpEtG7GKgPRtChDZd3E9
         Mia/dBHt6VP7wPiwf1FDgAVUtIRAPV3p82+6apjjJK06Rp8FG2eTYXAEuq1+YluSBGnf
         +/v8QztosIfn2G23qzSYfFfJIqQ5zBzpBfgba4XlibZx/blokHO1LDsEk9izF424wtbz
         /K4g==
X-Forwarded-Encrypted: i=1; AKwUvBwRfLtw8JHukuZ6dypMnuZdm/W4ahpiprVx3x5kag7kbdXlR6h/0fUNNNwi9TMp0Oeo4eH+T0nx262RzVY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI32utNWxbZKxCL7XP81+2ftPm38w6KcP3RwwhY+yNxhL18uxwS
	uZUqp7Rwu7MfQfkUk238iGGSv1kk22ifsxz/qDUX+eJ1JeLexMF9YeiHQz3jR8M5QrGjbjN50k9
	6sV/iy4lKLtpgx8J1iVxgx1vVG/5IQTk=
X-Gm-Gg: AYBFou3sAo9kqyDVKwUG+Y/apGW8TSoMbxWQCdoYcwcj/fV0wGOTdLVpLy8NxKHFce5
	Rnlq/QLZtBpieqOpNJS8n3DiGTE7VB/XclS8VSuGhIJF/i5pwSAkGsiikQLvhtU9XM+1VUG1w+E
	yTk5ih78mEb1CG3uPZbuT2bHknjCWAoQ/OvDscM/7bc7qiSBYdATA5w8Tki5Cjd/5uIRskMjbYa
	GgbctetVBTDKL4LIT+0Tlohn2J+VkXB6qNpSoz3aYaRsGlAaS2dJg44bOW824gIXRREjdBf0qKp
	aTdrJzlz4IYRUEBawsRuLGuUNyaB24AiJhTJdli32bjfup/Eze5CaAYbHKQ6DcYtrj7xiaNa2oF
	N/x1QerF8ILV8Q4nf/DWi6opduNl2we/V3JIsULhIxzE7DKxY352k1OiB6GFFMgmodzH0bsNmrM
	ae73T3ag==
X-Received: by 2002:a05:6214:21e6:b0:91b:88a8:2fac with SMTP id
 6a1803df08f44-91b88a83692mr594176d6.22.1791748793494; Sun, 11 Oct 2026
 12:59:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011191344.981000-1-linmag7@gmail.com> <20261011191344.981000-4-linmag7@gmail.com>
In-Reply-To: <20261011191344.981000-4-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 11 Oct 2026 15:59:39 -0400
X-Gm-Features: AclHuK8OWycGR8laOKN73W_qjDVrLxAalUKFqW7dRWpgX4ygrPZuMuZcslBJUcE
Message-ID: <CAEdQ38E5u+gP4sUuzYmQbyGv1NRf8x5CUF84AHnjo957ajCPAA@mail.gmail.com>
Subject: Re: [PATCH v6 3/6] alpha: bound EV6 logout decoding by the processor area
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> +     if (mchk_header->proc_offset != offsetof(struct el_common_EV6_mcheck,
> +                                            I_STAT) ||

This is stricter for Titan and Nautilus too, since both reach this
through ev6_machine_check() and Titan also through
privateer_process_logout_frame(). A frame that fails the check now gets
a raw dump where it used to get a decode. I think that is the right
trade, and the changelog says it is unverified there.

Reviewed-by: Matt Turner <mattst88@gmail.com>
