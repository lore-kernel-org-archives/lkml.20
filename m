Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986620;
	b=axeDcGedaYfKJ3vHjYlq/w93PNTU3cePw/llcLrUID8+4tc5Thbba88Gu4hJsy9X+c5P
	 NW1P7NMxVIVyIW8WsX7Uj7JioOqcL8ZBgqGw9oJUA2RXZHEI/No3PCsFb0gygoi/0GcLk
	 IprpqklzuwuoELiOWKHXQadUX/7193gA+xrmzC9MH1hEftIH0leol2mejRnTFLXTapf1M
	 HF/dGDQ/RjxP4HiHG85DCfUQk/beJUsqTlPF8jGPngJcbKTMDIwPfrDqaF7EwQRi9y/MW
	 tdzqJJqtb63PSGFCeEdo+0hv9JDLdyrZ7OLljbheibWVOR19Xk2/FA+4mnam+vEgneQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986620;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:CC:Date:Message-ID:In-Reply-To:
	 References:User-Agent:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=YYev/NC+kvw4uKd6ceqPEumrLblYo4RG50oIiemWCCg=;
	b=wsR8wbHEoJBeFhaSfaJaoexDJnJYKrOuk2piISPFe1G5SGKKp8jfqUk0RQkSl8yKKcG7
	 bks91Xl7RKvsiQIV0vpzzPGbfLT9eUzPT31UaCyfqnZjbXRRDFu6uSKWKQKuW9UrwigAr
	 jDHe9KYaHuqOgpjiOQLx0E0g0DSvZb3asOH69HgJm/qteCStCagi1u3SZKdHue1AWBau6
	 bKVACxenv3Xl/PyfjP0L/rAxVSqWgj3a7GVr8Wh+mriqjvSNm49Na6soFj5TUk8vC44hY
	 KYmN/CxMthE3uoaH0dvgXHSP+aMuTiHOKh96iSrtfYMxkqUYnv03tByPbc9EsCmtGoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UjLMT01q;
	arc=none smtp.remote-ip=209.85.214.228
Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804B8606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 804B8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UjLMT01q
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2e96502e447so7709055ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:37:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986620; x=1794591420;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YYev/NC+kvw4uKd6ceqPEumrLblYo4RG50oIiemWCCg=;
        b=2SzcuwbDdROpqj0bEZyXaKr81E5lbLbASLTTDy1q8YeWM/BoMZjwNF2OWX0/I7Lda1
         atfkTfesIOhHfrD2asHRQmILeAJ/UE086XJJDPKAvO72+zdOXTLih5cgUTa2S4oEFmtz
         jdOu3XaFjpF2QEP653T8bhAa9n6AolhBQGuMWk1tT3NYD+TgJQ0jaK2X2vrLY2dzsyw/
         YtVlq2n8F+puiU5i5d4kjlGZPY3IxkGrEOKXAlpVRlJnW+Ua2VBD3qGM74IMfWjrFgnf
         YtmPzdA1KgkxCfItGF3jw8swDG1MDxUbVQ97v+1zEL+wDHCEyHgzUTnqwcPq8MYTn18A
         Rs1A==
X-Forwarded-Encrypted: i=1; AL+hErEWlxPe2/nXPKRXANXgags/xsKdEoAz53TaH1jtfwugWMu0Ks8qf4ix4i8hIb95AmrjGy73ue5OkTI+1D4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YIUTjU7lDv3ZlurIsskE76Vj4MDt98cypDNfdog3I3FPuUk0I
	9QiPU3lAIyL6M5mofqqiJ5/d7O+4ZoApxJrlZ8bhaVo1ILORpwwaSD6+LsT+tOvN2MmrMT+DDSB
	Cdsd4Qf3Al2o44kbm7SOxj9yMj25pNxE/RHJlRFU+XOd8OL4ZKdTK+mi8pjTqaeluWqWv93/J5w
	H2sfMDzjPQlw+l2dRVrvZTd6xllOZPgs9c/LfhHolxwnENjOPjB0cQ4RPcPsei4UZLtICMpI0bo
	/d5kRYjgHwBo3Gg5BSv6e7URQ==
X-Gm-Gg: AYBFou3jjKrFUo1KQy1/ab1jHG+DFu2TOsn4dYIuwjDzaJUcf38HlmLxnSAxNsWQphD
	mFc6nCoGONCSiFfSLgFEi42C9vb+GNnEJGVsKRig/0LtDgBhhad38T1OjOqIu1AEZDU1UQD08Ac
	+3vQ9JB5eg5QOr8OtcehqLDm0DqgYuDtrXaDiw7fmvnpajZOuX7HeQ5lHjpScz8pXjt25H24r09
	cHMutGqPXNFGuKX+RZP+qCXT9aQth4fMCFUCUm6S6PzXvPRRTj5pyrCyIMlOVq89YbktuFhkWBB
	pD3p0gOR2L5aUA4lB5p9LVEDTTKSR/Hs+64G/CCJAXIRNiPCDtSit9haQlYKO5VNTHE7GGEjD89
	u8KZn2g3ZBGLgM0D71CPKXqQ2hjrsuaJXQ2Nj2Nq977gbSti48vFkFAmK+2nFIaByoapObcZDIh
	Lpvsot/jHytkza+8Yq49So6kKK5uNEs3p08Z2Rz00=
X-Received: by 2002:a17:902:d483:b0:2df:9a4d:650a with SMTP id d9443c01a7336-2ed41853f52mr40378325ad.29.1793986619692;
        Fri, 06 Nov 2026 09:36:59 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2ed477b9488sm673635ad.15.2026.11.06.09.36.59
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2026 09:36:59 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6b3f840cb9cso1169677a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793986618; x=1794591418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YYev/NC+kvw4uKd6ceqPEumrLblYo4RG50oIiemWCCg=;
        b=UjLMT01qgb5jh+U/1zOPAzsFWt+OBveBifEUvMto4uDWtCuU7rDkfZCxzXXpGRjkN4
         /UIO/JnVYQ86vF7NM6XFAwqonebR9Ki6QvvwVR23qxFPu5c5l4GhyZRoHjsxDcjSi0BK
         ORJeC2oBZ4UJHbC2vmY8PsLw0+pCdRgP4nj50=
X-Forwarded-Encrypted: i=1; AL+hErHz0MLvNr/fekst3cePm6Kz+8Ob/7gRN2j74GOzzZA4BRI9cO6qhmg5cnoA+GSmK593L+Mg+WCcQeu/o8o=@vger.kernel.org
X-Received: by 2002:a05:6402:2b92:b0:6b5:90d9:70a with SMTP id 4fb4d7f45d1cf-6b5977c1176mr2516059a12.15.1793986617833;
        Fri, 06 Nov 2026 09:36:57 -0800 (PST)
X-Received: by 2002:a05:6402:2b92:b0:6b5:90d9:70a with SMTP id 4fb4d7f45d1cf-6b5977c1176mr2516038a12.15.1793986617494;
        Fri, 06 Nov 2026 09:36:57 -0800 (PST)
Received: from [192.168.178.59] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b664ad2d0bsm919103a12.10.2026.11.06.09.36.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 09:36:54 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: =?UTF-8?B?QW5kcsOpIEVpa21leWVy?= <dev@deq.rocks>
CC: <asahi@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <brcm80211@lists.linux.dev>, <dberlin@dberlin.org>, <frankyl@broadcom.com>, <gustavoars@kernel.org>, <j@jannau.net>, <kees@kernel.org>, <kvalo@kernel.org>, <linux-hardening@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <linux-wireless@vger.kernel.org>, <marcan@marcan.st>, <meuleman@broadcom.com>, <michael.reeves077@gmail.com>, <pieterpg@broadcom.com>, <vanhoefm@gmail.com>
Date: Fri, 06 Nov 2026 18:36:52 +0100
Message-ID: <1a1b1ef4b20.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20261106153612.2aadef2a@kait2en-mbp15-1>
References: <20261106153612.2aadef2a@kait2en-mbp15-1>
User-Agent: AquaMail/2.8.1 (build: 200801029)
Subject: Re: [PATCH 05/13] wifi: brcmfmac: Negotiate PCIe mailbox transport with firmware
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Op 6 november 2026 15:36:19 schreef André Eikmeyer <dev@deq.rocks>:

> Hi Michael,
>
> I tested 01, 04 and 05 on a T2 Macbook Air 9,1 (BCM4377/4). IIRC should be
> the same chip as on T2 Macbook 15,4.
>
> Arend, with the patch we get D3 ACK on s2idle and s3. So this basically
> renders the D3 ACK WoWL workaround patch obsolete, you recently acked.
> So it will suspend now without refusing d3cold transition, but BT is still
> dead on resume, which is a separate issue. Just mentioning...

Sorry, you lost me there. What is the relation between the patch in this 
subject and D3 ack.

Regards,
Arend


