Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA963F8709
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 10:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790849710; cv=pass; b=Z2EEKA7BQsTZpajFAfUy7d6KC21dBu9eQX+BtkCQTPI2wQdGgObSJIZUGkJ0QbI+D+zwMm7hnhGiW1/RWOGrcZ95GGyJqjxLUIqL1gk3EscQA1+KPPaI8hld7vCpgfNF6vIbeJkpKIlEnscJyPaRtKvJFYcizMHHvGuRjDzDxX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790849710; c=relaxed/simple;
	bh=oYWMzc7dzXRMIQ4WDnbpQus1ZRBA7rO8qi5HTtl8Bo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LkX/X+ca3TML5rlYETn2Hbvfdn0a+MMDQkkJDWqDiYHl/RGph2QCHtcwHD9z7vegEx7P9WybTk6N+/pCZDE/zXiusqJm0mjN0hAKfpQXCR5E8KbUYNIPWrSzfw2zyVTu1MOgi3dg2pF+lyWdGv/+Slpc8SGj0rMt2O1zcAehS7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CdcDd4uJ; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CdcDd4uJ"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8e6ec4dd4so4962575e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 03:15:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790849704; cv=none;
        d=google.com; s=arc-20260327;
        b=UnmenTxsLSsDEY01wtH+0rgAK/MgNTXlQ1NIMv9rUl00jseK3osNqfnipkWXvIf/2Q
         U/+E9C/DZ/8BQ0rB+vCPjN8PxNqM6F9MZY+XSvuSZXTqRe1uD/83N623Y+VMfzaXXRot
         OS4z8qsyRtw6wAHsjuYSXswj4NCdLcs01ebXtavuJFD8Qui0V0bD2gN8hkjvG2d0zY99
         oaoRHE/M1+ns4uB/AYfLidOZGY4agP0Wr3ttQ1V92LO5LRGdGzOaWXV3gHwTuvr48/rz
         iEqxqgjeYjC5zUlMpc6A8KTv7gUPZZFOdBdKNS3ITquqsHlrcWVfGp+WMo98jiTHuygr
         aiVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oYWMzc7dzXRMIQ4WDnbpQus1ZRBA7rO8qi5HTtl8Bo4=;
        fh=a3tDw5HqCMoR2CSYUNtwqB+3yxEWFyaO9LMIeC4s/UA=;
        b=VkExmtfFUb3oOgPiYReeqgVKsfGhMO6Z4MtFf5sMnDZ3c30cQ7i+Fr0CHQXyQmhbBa
         djxxfkUGmTeE7xy299DqLnVrFmYAgRZ1hs8EKERFkuzzP3lQx/ESV/lX+PEsRWJc5mi3
         hZawiu5wDEAeF5nHaYN0PMU7OGN7Rqu58wYiucaSIwK5XWDUfss4k+TiRpB55bsJ5h6Q
         FdFUc97HB/T4M+q8BzfH8fS7sV4y3W+Aa0slHP680HcO6TZGj7Z69FBzCrpW35UfQ8EO
         loFq2vavbPzg0lJSH1ceyqkaSHbGDbC+2IDeHGPGyJPdAFO/XWsUFGETlV9zpWwQfUN/
         YuaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790849704; x=1791454504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oYWMzc7dzXRMIQ4WDnbpQus1ZRBA7rO8qi5HTtl8Bo4=;
        b=CdcDd4uJs9/e5t9qr6Wik6pzEXLJaQMPyb46DJzd36w2r6MkwIM1xmYZ1Z+ESQ1jMm
         iqyKdL/0VXk82ndLm5zV8LMPViXp0QZlpLlAdzHSv3sUUVxJcsdcovhTjZ0AqNTKEnwJ
         NS29ObGeppA8SxDJIx0SNmpk3UROeEJ1QYR2ioAD2thhczs9cKJvo/noGCTF54qr2fRU
         4v1Y3QZS+jPxxbCVuid5kYqCnR9B0AWp5/bZZ5mNW7f+N53NRGEeMou+FJJUbPRjMp8F
         1GR2CSkmqX9+Tqe9Rj+b9ABeXXCGpo5HxHAR6n8hRkWCqDtIVP+1lWuj1rpbdXWfJQ4o
         hB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790849704; x=1791454504;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oYWMzc7dzXRMIQ4WDnbpQus1ZRBA7rO8qi5HTtl8Bo4=;
        b=cwbOqqMgzJqWI1yRCxF8D3V7ZldE5TQZuyIS41UBAqQzTaTkW+8vZXScSZ/gzBEpis
         kFaqtrG8HQONg7bCB3mZS2QuYVpob5v2Ehjmyiv0q1J9GESsMrCaGLssnEBOfGW81yTR
         BIyzd71xYxRLdAGQyjAqrrzEiP7lrB+qzwLcErrMf2i3V5JyiWGZ8vJ72DI4BEFV492r
         ouIKvRYim4xVfgbwbKMi1zytzC0WLJkMIOIRueBHfIHVe/nBfKeM2v5a2jSTjsZlk8Ep
         PCnGGVoYyqr0VW3oK7tVsvzWpUSc0t54RA+VorPzi0eiar39tLi/UEzSphSPnJI6FKQy
         VSZg==
X-Forwarded-Encrypted: i=1; AKwUvBxHjKT62YorP27Kl1ncCel7+qBQyyoFd3RzR1Y9D0uyedv8HdEkF5qyW9/PsPUtGRgiX75e/UAMnASHeyU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkdGd0HQL2IT0Am1BuiiBoshAb5mNBi9r81pwvmKnCxm6kIF2X
	gNW+dEf6uHI7Dx2rbbkOWm2K04SQHvEr7hKTIV9BSfnvCMegyKRdMQ2X5ZAhR4bdVLoVmYRZ5I0
	vgMfwstI8qJAErYG66Jz75MEuD/YNQ+Hp9w==
X-Gm-Gg: AYBFou27WUE8GIqHXNhMBNtBH5Vb7F6flWYwlw07Jk6xYlZtADdTGw5/CzS9PO5Nkyl
	57xBhOxj4kqrk0UFVhK+95JHH39m02VGhV8Xtdv9AHjXqgrtsXn9+AR43BC6aj9iWKoInYulxmz
	5HPK/MRiovjyYlI2K0DfaV3TGul9joUCiVBqYjOaIJeftRJjJ6bhpp2McpwaItEPg7sswCAzP+d
	9E4LK/gOB6KJbhvnpX1JXeFkc69SXqDy9jcVS+RZTcDslmjSNE7oCcdiRxwZLc1CPeuXXHwYQOf
	BfpjVnzrxTuxsJuLjHPztpmJDFcT8suy4ab/b29CY4ZLgAvWiZ//1eQ/IEBP8vlvgw9Cqrvd5Rh
	LjTRmxX+MPIVrpm18m9bpWT7AmEJ/KXpCTWfvzKy6i1w2
X-Received: by 2002:a05:6512:6d2:b0:5bb:784e:3df4 with SMTP id
 2adb3069b0e04-5bb784e3ee0mr282162e87.46.1790849703308; Thu, 01 Oct 2026
 03:15:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001081005.2209755-1-primoz.fiser@norik.com>
In-Reply-To: <20261001081005.2209755-1-primoz.fiser@norik.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 1 Oct 2026 07:14:49 -0300
X-Gm-Features: AclHuK-74KPyiquqCXZSrY27gWUyd7LOlkpNPte8XIS6tTUYVa6o1fJvZXPOZX8
Message-ID: <CAOMZO5Aibmm3d=9Ucro0Tqvyh_s3EozLM25axV3XxeLuG67PCg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] ARM: dts: imx6: phytec-mira: phyBOARD-Mira fixes
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	upstream@lists.phytec.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Primoz,

On Thu, Oct 1, 2026 at 5:10=E2=80=AFAM Primoz Fiser <primoz.fiser@norik.com=
> wrote:
>
> Two small fixes for the PHYTEC phyBOARD-Mira-i.MX6 boards:

Shouldn't they have a Fixes tag, then?
