Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794493968;
	b=vUdqak8cqGUn1EvngJbLn8kPqdh9eEHwkr/p84QjRt9wV6TBl9Xik9F5sXHygt+PWtZt
	 VvUk0soSmu+DLkflXYhO5RW3nk3qnEMfXRQbRVwbqgSFCYVQGphFftI4ipYoPueNx9oL9
	 HzsvbXjjvyhFpdkO+tmdRG/PR7VBCgbRoBuV1IUOv9zvMkxOO7S2TJC0YBkFAeeAItEU8
	 H7RuXwUro55HQa9VNm4KV2nBLFMNKEvmvidMQXaHO2Ezk2k5F8vAB1tP25YPwHN4Eg0X4
	 08bPdZWtsZUxDGxDWIBhQa7EkdOgUw05XnpqkYMhWEfxEonff+pe9a9tvlfhYzebxIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493968;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=mZcXDkDM4tLOIZWuTJL+zhEVZpgEEqZKEtZyr2yGvYY=;
	b=n8zHeWjuyNGAvoUeDHIi+zdnkVJb0PwyNSaeRnBBa3CWAYhdD2H2JwNH0N3aa0eM2qMW
	 yFai9WGC0YYobyvdMHJHz6oQuXx0//3UCzBtpdQuIQGGe11O8jun8UtmEnUn/lAW/gYlR
	 rXIbRJVtBOdSZqX9j6TgFb6vBoXC5i+DjxtRx2mqXBaJkR5WhigzNF+oKz3M0VAxfC7vi
	 VRT65Bvu6H937/nuM3YifeI/hizVFQi2Oo9pyvYP6JAFTJ23+HM6B3l+JI9BWz9/UkTnV
	 h+Ur/BBKND2PoYDbkzjaWPdnAyMlkASXNmZJOipzLnFd/5giGh/vT5b0XBDTQw4hd2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MwNDJuGu;
	arc=none smtp.remote-ip=209.85.217.53
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F89606A88F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:32:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5F89606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MwNDJuGu
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7d2dbe5c4b0so1463150137.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794493967; x=1795098767; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mZcXDkDM4tLOIZWuTJL+zhEVZpgEEqZKEtZyr2yGvYY=;
        b=MwNDJuGumbfCpm/nvNtmYBkp1sXBfTj7FXEjMe0FgXpJcfEgMoGzZGnBsT0//GwADA
         rFtAHvzzpd1Yz2HOfEuJQfX9E2lmtSB7k08g3BF3U/LbxlJIp7/9D+O3pCDOxYAGtwXI
         pLZWJBLpAFPfvDUdk2MPNPIv4EyLqK2Vx/XHGIYWqpyFyuxk1pZzbL18XFbiBUkqfFmZ
         SOi0wpZYMoUXca7nPK7cGT/owzhufMvRLX+ao+HzMk9z890UjTZLn1Zz/SgWAxgknuuZ
         +2hIZUG9tMgtrp0VDImLsjC7jgYu81UvmgLXSZD6uu2ENlOM+Oobw7CRSM40LhwSSO4J
         qOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794493967; x=1795098767;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mZcXDkDM4tLOIZWuTJL+zhEVZpgEEqZKEtZyr2yGvYY=;
        b=0aGav5PQQZ5ZSu+McK11zIDkLs+G6aqCF1COK3od4v2wZhxGDkaW5vvFgDjbWbwBtB
         UvIdyP1Rgr/yCRAQAFQPWNDnlQNpqGrfuPORuRhK8noooz6hOeRyX/lj6igFUS67He2G
         9ri6nbVUBLbm5KCXwiTTltpsD4Ytqu9jrNmR6f75tJ8As17gpRo29sfiXq5tfgbVL+Fo
         ibcorlyIMJQiHbKOdSlpHe5ObQg7txdu+9VEW1DZwPt0Ak6nK/jFRnzNMdjv8cMVeV1b
         yP1LjVsFeGmhRKXBuLrq8YTRc14bkRBU3mK5rUT+Suj+lUsk0ckCQTw5Xk6uJgaoRgbp
         2X0g==
X-Forwarded-Encrypted: i=1; AL+hErGLq/+KC917exguhF0fHSCQr1iIVMIOjiPJMX3F6JFK+CLQXRt1PaoBl+Go57EA2LnSAuORMO44oQR1xqk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9X38CbjZqcqlRwEqL0A5KQ6KXCADIQ6wfyxgcm10YkThSBlhB8
	JSE2LB1TDuPfyWtj9PEgo1yu9f1dwurlRkKAZs+zWKrwrt0XdK/YPf/X
X-Gm-Gg: AYBFou1fBNTwy6RS11wM0JpF5+lBGj1KGy/Xkzb3oTzE2Fc/zqqNqHJSbOdtEuG4WIJ
	QI6avDid952pcCFx4um4y6u9u3jz9cf3FELS9h75uecO9Owe3kcnqa5RVKvq0F/1VRRErCQkXgP
	y7zGhAUkpoXnWTniQ3TgSSQOUYvqBv+hBCyCrIVJ3H3HksxMHY+WyhLm3Gzkifllt9CluGtTkoQ
	K1cst3BzAErBKt8o32peIMwN1x2Gy2YsPSw36oA8gL4R0EQL7zE8HEDCtvsgkhyYa6DalC9un22
	GZzgUPAa0v9zPYJFQAEdi6AyhkaUVNEtGQ1ZRViTD2s2ki9CfUvlXDtltJcFH6pdwSXUHL6u00E
	xIrKUspEvX/e5QjEbPyHEd04BRAqDRX/wmU0eWp36AQV7aMmDXG8imIZFXDgyCMhZrnUqX5A+LF
	0h1f+EdAwws4+5A9sUPJdjA4prKBEL/wSiVUO32Sofs7F5Zhu+Mo7jfdD0hggdv/VabeugaynNj
	eggLAZSBkUkFJ7XZKkdSQZKILofiWkIskBFsJ96ckkiLUBmvl6pG1ffh+L2wf8bC1nApGRlhKhH
	pIc9QhSqITkcllUSikxGI8yyIPIGb8aE2A==
X-Received: by 2002:a05:6102:5cc8:b0:7cb:288a:b68b with SMTP id ada2fe7eead31-7d506146d9amr1933561137.37.1794493966318;
        Thu, 12 Nov 2026 06:32:46 -0800 (PST)
Received: from fedora ([2a09:bac5:565d:323c::501:5f])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d3023aeac7sm5761387137.9.2026.11.12.06.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:32:45 -0800 (PST)
From: =?UTF-8?q?Oscar=20Alejandro=20S=C3=A1nchez=20Lucero?= <aleszlucero@gmail.com>
To: Massi Djaiz <djaizmassi@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Oscar=20Alejandro=20S=C3=A1nchez=20Lucero?= <aleszlucero@gmail.com>
Subject: Re: [PATCH] staging: octeon: Fix return value documentation warnings
Date: Thu, 12 Nov 2026 08:31:58 -0600
Message-ID: <20261112143159.60591-1-aleszlucero@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110171618.4507-1-djaizmassi@gmail.com>
References: <20261110171618.4507-1-djaizmassi@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Nov 10, 2026 at 12:16:18PM -0500, Massi Djaiz wrote:
> Running "scripts/kernel-doc -none -Wall drivers/staging/octeon/" reports
> that 17 functions in drivers/staging/octeon/ have a missing
> description for their return value.

Hi Massi,

I applied this patch on top of staging-next, verified that
"scripts/kernel-doc -none -Wall drivers/staging/octeon/" reports no
warnings, checkpatch.pl passed, and cross-compiled the modified
object files from x86_64 to mips64 with no warnings on my machine :D

Reviewed-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
