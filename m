Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5962495AF7
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789678989; cv=none; b=I9RY4hRfwpbsGAYlRwqe+IrgTbCIppb6jvYhCXVJwG5cgnGRo245Tr/yAD9QDDejEXhhPHxaXGKTwDhofe+UdxihyO7hv8IPbaT4u0EGPDde/WM0j5zDEY8MVtxhctZGvlsDTQFkE0OM8TM2i9QfhSwIqOLHCl/HGBpWBdon/Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789678989; c=relaxed/simple;
	bh=X7CO8plt9rXRb+sFi8w8w6XkMwhE0mA/u5iv6DISDeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dezf/DrwMm4M5sgte/HTbSTgJ9pe8pEKUxKnrhr96Zzt4tQHEEreClUWYlyaN5L3hpPY9NSODiTfzF9MR5IXmoLcuYT7HyvOIQHUayUX8IYLlqfgc8PRz5iF8kcr3LxtgIlYxM8LOOqfu7yKn+yjqSUQHPV+8ZmIKfHi5ir0ALY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dqsjbx+w; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqsjbx+w"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff176d5eso930801fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789678986; x=1790283786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xBjt8nETg6odEPjXmUPOag2PgcmXewPZyiuP3+CiCYA=;
        b=dqsjbx+wjAXLLHT8yfCoIFCUF2oyQYSyhjSK791qZF9g6+oM3fPE0If1HK8OroyR31
         9w5f/R8EGdRRBZmm5+oWl7lZ9xuD0nyIp+NS2ayxGNIsOo7GvrLHo7nzxCbXAba63z3n
         h9V2Y6u+HRHep6M8Q9Uja4lDs6GVr+puWgFe6ETIXKtGwnDCJliLRcdRp6EQOdX4TPUv
         YSXH/rs4e/t8de8XSpw1y8tBuhNj1ejoXPRsjmyvzdfcIPm/YlqctavDf0Gndm50+bgm
         V9CnljYnv2DFWBi5b2IgU/HCzZLtZBCLp3Vj58Pweki6/jTOeLOFfA56YEk/psDePOx0
         8rOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678986; x=1790283786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xBjt8nETg6odEPjXmUPOag2PgcmXewPZyiuP3+CiCYA=;
        b=PJmdi1Cg86H31lga5tu40SKCvA/ftSyHoN83LOCtY5n2/xTkzmXbrcTDvuPgiY8Ekj
         EWd79zybn1gaQL8zFeqtRNMUyfVLs8hvbSB5J1m0kIryVIYiu8ZWCO/x/rXiXqY95TRu
         aIq811gLE3/ccXwoyUQx8vqYTVy0F98U9j9eeZFq782aUD+QXiuD9dricFyEYsYuV0RR
         TTQY4d9L6ZqGwv4xzua+3AnGuSTjLudW3U2LfWV1Y4qOC+tUlgqBMB4W4kGOpRQ1xd+G
         2HTzdezhQcDHuXwkbiL6VEx9lbpNxxTyhnx4ExKBwaTaGziWHIJc4lvXRBM09iuRbSfH
         ssgw==
X-Forwarded-Encrypted: i=1; AKwUvBxZj80HH0gWELmdVTZAocrZI+nTVkccYSAozL/8IEr7vC4bJkiXe0rfDDAqV/R1Uw3oA3d+E4kEab+r3tQ=@vger.kernel.org
X-Gm-Message-State: AFuF++k0wqLjqwB9RWEeK0oANNZk3khWB1ZC58egC1TAULFe/7+Q+amU
	M3gH5b+lWoT3OXwvXZQM4BRYZnAlD+8PGci6EUG5nNVf7/M4Xk6jkZBaV+elJrPx
X-Gm-Gg: AYBFou3eJ0SYz99wjumexiX6yuZEzuKkEPV9P9NLaMHrj06TrM+q5RdChPPcpjMXM4c
	cpug/NEa3LVwKXWTyi4/ZK5RuC49aza3LkzqTpEm9+BJ+5RV0EbbMZl3emE5DXlkKgzUC0AQuzj
	GePBt71EyZ8Ttd0hdKf8NFSmiM2WflhIzBPYonPX4AxGk/FKgtLlJmtY5MWEq0TdfHxnKCW5NM3
	eTyVsPRL7/yP00KZ4kSsqFnhoQ7MsfiB158/oLCw5DIR0RJ4NHlp337bDfrZcH65zYi593TYFNY
	6XcoTWPauuKHQquDwCsSIYSoB9zrnTi6DcxI/lUdb8HiI9QL2/hG3mVO7dRncTnGTpnmFHHbDUd
	mNgqlZOm37jsGnDhWBEO0SeK7ln8ZJs/wWojGbxMNivWI6Uk6cVLd7jeBxRUI9m/aYAu5mH964V
	EHhaRrQndXo2+pzJEXbl3hmOhHQ464Y6eOjMTMHYD0A1S6jFyj59Ryb8grnhjtnjWV4KEwTY85s
	lH1
X-Received: by 2002:a05:600c:190b:b0:49d:870:7a69 with SMTP id 5b1f17b1804b1-49eb73309d8mr172142985e9.12.1789672289184;
        Thu, 17 Sep 2026 12:11:29 -0700 (PDT)
Received: from chicken.. ([2a02:2f02:5101:7300:c13:5a93:c17c:533d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5295fb9sm1057055e9.4.2026.09.17.12.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 12:11:28 -0700 (PDT)
From: Daniel Matyas <matyasdaniel006@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Daniel Matyas <matyasdaniel006@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Matyas <matyasdaniel005@gmail.com>,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: axis-fifo: Added missing binding
Date: Thu, 17 Sep 2026 22:11:21 +0300
Message-ID: <20260917191123.592659-1-matyasdaniel006@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <458017cd-c188-4e41-a93f-bd6bb123179b@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 17 Sep 2026 20:24:56 +0200 Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 17/09/2026 13:48, Daniel Matyas wrote:
> > From: Daniel Matyas <matyasdaniel005@gmail.com>
> > 
> > drivers/staging/axis-fifo/axis-fifo.txt file described how the
> > devicetree of the driver should look like. Convert it to .yaml file.
> > Issue found by checkpatch.
> > 
> > Signed-off-by: Daniel Matyas <matyasdaniel005@gmail.com>
> > Signed-off-by: Daniel Matyas <matyasdaniel006@gmail.com>
> > ---
> > 
> > Sorry for adding another email. I got locked out of the first one for 30
> 
> I already you no and provided previous discussions giving the proper
> reasons.
> 
> Why did you just ignore that?
> 
> NAK for this and any other future axis-fifo stuff like this.
> 
> Best regards,
> Krzysztof

I am sorry, I rushed with v2 without checking all the replies. I will pay
closer attention next time.

Thank you for pointing me to existing discussions about this conversion.
I will drop this patch.

Kind regards,
Daniel M

Sent using hkml (https://github.com/sjp38/hackermail)
