Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483635;
	b=p9PL74wB5eQ1kQ2yruAACtFB2JnjXdOmR72u2YpNvGHp99+6uJnvS/4BaA/6kIEqaqqY
	 VmJ6RSrIIuMybaw+EIIgXC+9ypMx2w4mwrXmUT5tWGR1RUDaUnvEr1yw4wqoWt5p6i3e5
	 QNqJ+gUjbnespkplByMWf5bCXh3uWNBV82gorJIymN0drgkE6XYV2Eq1sXavHMCO0u7Iy
	 A0wcnthDxdzXAiq9CQ1jZrMHsv3Xht1XhSJFhlGAFAQKnYcR95Aa6PYQt7/oaRCMnNryR
	 gNNCO6QtVRQ0+8R2SMp8N2F/8y37jaGRKNfbJjCY0ldlSc1oe+mNlMI7Aod76eBmlgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=gsyHZxqCFC3P+dq4T8RF1a2PV5Q4RTtu+8pGfoK5wSY=;
	b=zC2l8ir/KbhUusdl4phXlSUkTSx0pIdt6VUvBn+/ai2XJ194WHdDFkCCLuIeQnxQSdIG
	 hvJ8Zi888HUlMd+v+4iyNLeQub+KNYuqtn8mYUWN3tBYskqN5KKNH7sRbvV6q04jMdpQj
	 ina3DpGBlTg6V8jndkzsuBICfwR+nLfCGUh5IDbZyJyWiAnATjKefAnUmpPoY5xoIzJUc
	 zGbSauyCOy8pFaXwBad1JHlR7p+8DInvGXbJJr5Y1It2dDuPR884fNmCA5q9chqPbPOJk
	 dgvhA/Wg62ObRR9LxAO8tXMxeMXa4CjojTAqwYy5QIwZU6N7r90KeLBv0S9yh0LmUjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tge4VMtg;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3ED5606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3ED5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tge4VMtg
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso6239968eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794483634; x=1795088434; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gsyHZxqCFC3P+dq4T8RF1a2PV5Q4RTtu+8pGfoK5wSY=;
        b=Tge4VMtgjclRf+pzqJS5ekHgrHrSCeLOgPSO3I999bp75xcBC8b3SPuoO4TVQt9GeY
         6Se59I35oN6hfE9b5PLhIee2YiKtCwceIWizMYngrlh7z9vW3d7YavPI8yX4AebaEZ0P
         fWAB8trYbj0Fflmm3fLqp5E7+zLtbrlg1qmk3/kXZmrz9LSvVdFexcJv5nGVaqC+1DdC
         N1yjB4y5etDTAi5yPr4dyF9bo1YYiLge3oXQeDooNIPtCXIFY8Nws3bpcE4aFuLbLBfd
         qXxh88iCWKoA2uwCJN3RKMRRZ3++I4a+COuyC9whueEG4CmGqfByH/mAk9dGAeIU1d63
         WqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483634; x=1795088434;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gsyHZxqCFC3P+dq4T8RF1a2PV5Q4RTtu+8pGfoK5wSY=;
        b=yXm8im3WHWKW3LTT7glnkSQ4+uIL32aJRT0+Yar6lWUG4z3AISfxYVixwUangsS6qK
         eVzW2gp05xR5gPzleEFPVZ5D+YB5H0+rH65IGvZ2dhRxHdaKZWs9y0jW2T9PFhBrNykn
         VFkVOPLl3jp5xrf4ohmr0c2bvKonvR82C5vfJqa6agaQusAQyHXYz8XsFrXa+cSMqJ/N
         A5PO3qqo70fwowGTfBD4rB85sSocBq4NKCj37OZh1zIWUCGL8PMVbRWMbSVxTYq0wVnq
         imyzPrwX0uySsAjvKpy20KoKHvoF5zHyqYANlc9tRLp4CuTzddILsyTbhc03TSm2H5yl
         avhA==
X-Forwarded-Encrypted: i=1; AL+hErGVdpeIqEEmLdW5091iQIYNUYI8BpfFFoDVT+P6aXXodi5f/PLWKwztvO30vik4exyzD1Ld3Zaunwb0Kfk=@vger.kernel.org
X-Gm-Message-State: APuU4Z82f6bxlNRl2inBBbDpRDOI6eHe9IUOA/ftVAAnc3evilftlKYu
	FDvic210TCgOCwcdlLgtvPRHBZqeWq2DijMibbXWXzm4EobFAVRFcDvl
X-Gm-Gg: AYBFou1uTZL/7JUl8O+Cvik2aYi7iwcQYchcbEUiqpg6qw/iLdrauRI4CZpO6Ls0lUc
	GFw4ZFIyor1zE6n5NSZk5cNq/m1ezIXLws2SxkjCU8hRMdj3Bn7CfiY7jbP7C+i41rjRhW9LZd3
	U4qUipf44kZ5dYr1guCPSsPkQnMictB87uJdrGuVXoiluXWt2IkGsTTswiplDzqWhy7zVCpgWlq
	RkDiAwCa0RWAyFCJrbnM8vG8XGPQCSlB2PzMTVEKqHncDUKmDDfS7m60hBSJqer/NrJEsMtV3zK
	IUJHdRjkTXAkEX3aq94xImJlsvctnt7q1DZIsI5RnTgKiFyDqW4MRhFta1jmyQMx50NEEVe6Ctw
	MppzupsBedf83ToJzIgGyLCg4Atsuw0OIMLJGb55oOAArwoUZva9Wi6h+oQGnuH45haWFb1J/vM
	XkTtxbsxDzEaKudko1FGOwPJ4/5VrDPWDmKoir3CrPxZC6WujMk0Mk30GmI7S8EheQOolg9CS4N
	/7lqAnibybPdTTALXq2k4XrbDuDqn+9BZKe7kKYYox+AvBrszMistFaV1MuIi9N1gncB7AF1iHt
	gM+PT/xBkU1EzMQOi4gevghECy1JazXDTBeRQpizvg==
X-Received: by 2002:a05:693c:8344:b0:369:535f:4d12 with SMTP id 5a478bee46e88-37683188720mr4399109eec.3.1794483633595;
        Thu, 12 Nov 2026 03:40:33 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([180.67.33.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306casm23450944eec.9.2026.11.12.03.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:40:33 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abel.vesa@oss.qualcomm.com,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] usb: dwc3: qcom: Keep USB 2.0 working in DisplayPort-only modes
Date: Thu, 12 Nov 2026 20:40:31 +0900
Message-ID: <20261112114031.126-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <avUU-99gu3YbNA0g@vbox>
References: <20261103135057.1682-1-26rote@gmail.com> <avUU-99gu3YbNA0g@vbox>
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

On Thu, Nov 12, 2026 at 01:23:30AM +0000, Thinh Nguyen wrote:
> Can you address Sashiko's review comments?

Yes. I replied to both reviews, and v3 addresses them:

- patch 2: https://lore.kernel.org/all/20261112113958.166-1-26rote@gmail.com/
- patch 3: https://lore.kernel.org/all/20261112114004.182-1-26rote@gmail.com/
- v3: https://lore.kernel.org/all/20261112113838.506-1-26rote@gmail.com/

Thanks,
Joonhoe Kim
