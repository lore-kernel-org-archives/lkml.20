Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794244685;
	b=AHwH8GQ4/0eBcAEIQ8SsM2P9E0kkfqTpBzzIii4h3sqPecpLVh3sc6ogtvpALbK6TYhR
	 zYJeAOvWk1rXDPediCh2yt9PqBKK90gc6dpQYW2l6dN8r1IssKOnxorhwPJq3HJSN5QP3
	 2K3/E5t04v2J0iizaSy8qzu+RHxH7AABnIKZscqQfrvQjZO7QAL0+s86DA+8pWn8PSD4T
	 uC7ex+h8PTv0svMbd4hu7juI9A9WKA/GNP2yZrFN77egIDxdGaiCnfx9PfT96Ahs4kfP9
	 zWE7H5N+ndoWGlpyvoo+FMqlpfm9+jXkFotob7llkfCOJreEqy4RUpXOz1g1dazVN4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794244685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z2Siy8NkZqN/VokropBjA9uuaJYQWKIpte5yuEqWPog=;
	b=GHoJaMcRT9yO3wzZ9sybE9E7ybPCU2rSG77qi5gSWHc24mVcTnplDE9VlVW7p+HEMfOJ
	 TSCeb0YizmfkbUq/ZMr9rhuVguziCADzW5AJdWDgvNhP+OEEWPM3BucpF226y/ZDXeS7Q
	 d6m6/3p9cDR+NEu2NI7ElpO8VLNDwT+3BVU+KVXGwsqHrWKULZ1oyGBjhP8HYa+Hq40zA
	 VmkKLXmB0vWKErAAWrq+oAZV/sQCeE8ZZorOH7N2jAp1GRwwCla338g6vhpLr3zkJF//U
	 EKX7bHpJ2/yNn69m3vDxFQEy9c9GyZAvhP3bvbpd2MRyPPxHZ6V/qMrjL6MK22qVg5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rmMyyBcX;
	arc=none smtp.remote-ip=209.85.217.52
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B466B606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:18:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B466B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rmMyyBcX
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7cc81984fceso395082137.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1794244683; x=1794849483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z2Siy8NkZqN/VokropBjA9uuaJYQWKIpte5yuEqWPog=;
        b=rmMyyBcXW7ALMVD9INlgkPTUsukaT2oxRQw89G8pOPAcS28S0l1nSTZQCl3y51nwjv
         QJXvM07wCT4GlPuMOA1lKn1deIn3urGvfJDtYv+NJ56RqjfT4SMGK9ftM/ZdEFgLDLXr
         RvQYmTjk/m0scfX3E5G4ju0zk9P5VO+lu8rL5oer54KfhFDj+1g9LeW1BcG0G/GAc16V
         vP/cksufXyIYSLVVCNpCjTFv60ux8ReHBQNguejFmP+9XNl0tckQduyzkMvL5Mv8XRBU
         Vnh93LPxH+c7FVBR/1BJWFzvUGuWcXD27J1CFZ4PQ2NCjNSM3IUahWPEtwbrfU/FTnRO
         A7bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794244683; x=1794849483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z2Siy8NkZqN/VokropBjA9uuaJYQWKIpte5yuEqWPog=;
        b=X22OgMy1IDR1HnyAK0smRV6Eg+1B/MQ5hzgrq+MrIEd4z6dRKpNFPQwjfmg29qJa7l
         FieXPo4E6WTePEAp1pN1yNW0vN0I5Baw+sz+KdnYwW8BWkkJuNX1saV9P+fezYdm6vGv
         R0bg1pW+xSm8wV3AjQAn6zwn+Zkr+Yo4jEWVo9hSkFOfXDnka/ldHShFA2I8On6MC/Pc
         HyMhjhO7H74rEXNmMY/W/w9RPwSyFVNtCl0M+GCnhufxBkrqSXrU1cqTySZxUwfGtHBg
         4nNRMDHx+r9rCRDwKo4bbqD4BCzO+aPLq/uBnO5bHmYAWI9W/g5kj861FYR/IKVNNpp4
         Icog==
X-Forwarded-Encrypted: i=1; AL+hErFVNXRZS0z47pS0zx5BpVk5ESpCIbCE/8gWrdy12GyAEE44A9YqZnXJkQd/RBe5WvPl5Tf6e2+C+AzJrSM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BHqVhU7D2dwjgUedDSjQLSdE/0ZfoCDNnj+6dvZh97UIIsiff
	GmV0EhYtktxpoOseSt/sWbrirUK5L5XVVvoO29+9ziF55R9mYsBX2xZLkHWTc8OL3v4=
X-Gm-Gg: AYBFou236Rdr7a6oxErdP1xxWvd/ZppIErmFaB/TMM15hpWIzq6UqnK98YeFPSKI5XT
	/lTWXqR4KAHVenXkg9ZgiVwS1ni6m2HwBuab0usdGEEn59jy+hYnI18jspy6DDVUVyt6MhJrdUW
	UWMUKSZ/yRrYysw9th9Vp415VbXKLlDf/v+DVqIH4LZOkol4j1TFGeojz8XqnGJcvTLzvDqZ+oI
	GQAcCvjYagSCnTkHg2RVdsiIqNBox6KRW3b9FhNPM6B0/LrPjef3ioE3EhqsvkIeu4iCZrZYkP/
	YivgjCBOSgxMp5UZ8HnPnbj1Li9Iijs2rebvv+/ekXF1qu9jykhVFPm2Ja6CeqKoQ8T8VvJdcGx
	lDLymXdnLhUQtJZYtSxQc/Ia904fQIge5VDwaIMJNB/mC8ejCn45g4WJG/AvB2wrC9dnd1c5ypa
	lUW1/YvmM4EgA2Ndtt4YWBkoaEVVpcCeh487mjnCssiMHLb5KE91Uw0kwrvlXe28Au48CUl2hqD
	mzKls/d5g/pIoCWliPPhKRoIfrb08x1uD35Piq9OxCjJ9IBJXubPbG/jQY0iG7sviAGFomSxohV
	4uJ9CV4fYT7jVmYgEhgXDm6qLmnk9E1pp8zwqpBY+ai6+2vzfheADEfalLbn8r04HUU=
X-Received: by 2002:a05:6102:6891:b0:7d0:3ed0:c61c with SMTP id ada2fe7eead31-7d2db0c3973mr1355903137.16.1794244683474;
        Mon, 09 Nov 2026 09:18:03 -0800 (PST)
Received: from localhost.localdomain ([2a09:bac5:dd4:1c96::2d9:5d])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d2db605322sm4323468137.7.2026.11.09.09.17.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 09:18:03 -0800 (PST)
From: Allan Siriani <allan@fatecpompeia.edu.br>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Todor Tomov <todor.too@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] media: qcom: camss: always stop the pipeline in stop_streaming
Date: Mon,  9 Nov 2026 14:17:57 -0300
Message-Id: <20261109171757.76911-1-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <919e9806-5e1b-49ee-a88a-7b6dd6d93c18@linaro.org>
References: <20261109112611.94010-1-allan@fatecpompeia.edu.br> <20261109112611.94010-4-allan@fatecpompeia.edu.br> <919e9806-5e1b-49ee-a88a-7b6dd6d93c18@linaro.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 09/11/2026 13:02, Bryan O'Donoghue wrote:
> this comment is completely redundant
> Please drop.

Dropped in v3.
