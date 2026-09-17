Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49244A7CA7
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789638766; cv=none; b=CI51q1NAJVMZR2bNm+31kqoGk9keGhxiEL+iI2VvA8L0FfAr8WRw6oSdq7jz5zV2FH6zykJ+K6gjV69nbwjFUkJZu23CtPrku39LFlsCRtVxM3zAD8haGRyvGwLHH3Qwx2a65xP/nmuomIBWgdOF6wp4Xw5Kf2GCpRigtvvowTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789638766; c=relaxed/simple;
	bh=eCh+lQ06Yqem0J/L72w7Iu/+L9tJW4QJJeQpsqN+QMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F8U0MALjAe2o1RAAAf27Ct2gNoNTUDzPegXY/VivvH1BoV5khs78YgjWPMe3qG9pB/pm3ie6dRBJPxcHsFygh9BAaSuBZm4HjlxRfK4FO2/60AMxCkoqY3oCoNOyzGDntpYP92afcDDfImXt08J0rHKA1tIw1zwGDsSj/sLhCsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lRQanFvj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ekDW3YHZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lRQanFvj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ekDW3YHZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZlEc613584
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:52:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vj3q1rEatZbNYhDgOOz/n/ThSNJKjldYi19PJG85UUQ=; b=lRQanFvje23OlNKQ
	KqT8zUnUqp9FPzKbNr2Gp/oUtnxjUzP5x2c3Vx0qs5WOceuBBheHn5c+vaLRpr1p
	pmRHnORK+zWx0bptt3/Ziu0iQ28p6ZkZVJFADiywpEDfa0Y/OzgLkmCdlpfvEgY9
	tsVQzZVMDqlYrsH9PR3CfO56vKLrM9NXiDqxQJzheWDVaMyLMCHEYG1e4TE12YOF
	aLuNAC6eNjLFTfgMPJ4vV+Q+6fdayk4AT45G+lO/hhpuggvk0RAQJzLw297JxqEK
	DOW0Xjbcjk4BT5MUaX5zL0F127igLsF2719KgmJYB1qPwvY3t4wZv+DT4b6fmoO3
	UZRpIw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grca0reu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:52:34 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91245cf2b35so8979296d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789638754; x=1790243554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vj3q1rEatZbNYhDgOOz/n/ThSNJKjldYi19PJG85UUQ=;
        b=ekDW3YHZGEX1ifUtviIMvDjdoxIcjl9HYUj/g4e79PWgOfwavyZqkYkVSdt8j9lQuT
         9RHltY9fpJzTo3baJxd/W5S9jIgcZgM85bqqpemWklq4/4VIF21RnhZZlCBxxL4epXUW
         o9L9EBU+td7+LqM5LWeJY1hqOPr3LtbWPpylPlD36qTjm5lOBT8nDP8tSSOYpttJczdG
         xqDT3SU64VEW+vkhYq3uMCpW1KhZ9y3rva1+PCFtLWIkQg5pYgbE4TMQwnKrXM9aL0Pr
         m40zV+A5DYYWnXPWg0GqrYUCxDJVN4WeVNJWPfOYa09IAw8HaUnE/6xL4hCqYNa5+CIB
         ytQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789638754; x=1790243554;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vj3q1rEatZbNYhDgOOz/n/ThSNJKjldYi19PJG85UUQ=;
        b=tkOp96vyU3qY/7hRMABD+HPhMf65Of7vmpwfa1uh3I2xdEhBm1SABHOyfeX7+B8n3h
         RC4wsR08e3igvh1KMlS0P6trGS62Q36OJCYaC8mNR3/y3XUViXGWWPUmO7SxML9yXUcJ
         LLrxBpS3OCMuL9veEiVc01N22Yrb5wRM02At5I3LmjccnEgenb4RXDJtGZf2eQWIwnbh
         XIOagBQm+ZBFF+3KijjxOHxlPHPyRM2tIRzszK5WvpqAdDCqd+bKKvmoHL2oTne3Fiqz
         dnb5Yc/e4ymimxonaQ6lu/ewgtYLc8WtSYbqdimK+tbXt4Bsv99ytYptrj0YJ8wL4F3U
         iokg==
X-Forwarded-Encrypted: i=1; AKwUvByDAjDclj0OKHhKPr4Nt2kuzik/8DkKcoRgLqHxF/+2cKWSo0K/+2ksDi8htJWNNGszYMvmh5OaEYzy69E=@vger.kernel.org
X-Gm-Message-State: AFuF++kdPWOuHTsAaBhLLb0LJDVdBMKcPVdOlRODJcJkak4OzPh6Y01p
	00DMIqMLsdvLO0K/AySL1UpsfAoCHAgkQl2jCbwHWqqkEhea9sK0Blm9oGLcIe4gENatuFyjVic
	KpG4F45mA2UTA7W7UqWJG6l1OM/bkQ7aTWi7o0KKqlYG9vCs+nstdcikUyOVFBW1wJBwxlqNDoC
	g=
X-Gm-Gg: AYBFou2RbPDv3apnrvc0g+Io5EEb0kSN+9KVu4OswxKR+iQXzNkty/4BJgaiNgsT2+P
	DbLatiMhYskVhKqzfLWVn4XpfTc39/9KokInGjGhdeAW3eEr5vMdRAiLg18RjShUVFXQsdvHkIp
	hQkcezjoL4aawyBz1ei4qZnKFOE8Pji5jwGNmptNNrGS6yP/dLcLQTiNjDXCdI3agvPxYKAXtbv
	QYL68JGrSSYx/tOaMo3DArxh/xVtBG8kQRQxOCkrefIbufMVrENBwMurXaZDW4Q5zji6vsvGEW+
	t1cH1bo4bqntRpRV5DT5K1STw7JP/Gl7+b5g9Vmma8N1i3/DrZPJUmqSOQ7r8degPvCnRnq0EuK
	AmyUf6qSRiqThlptakiXGcV4S/uw=
X-Received: by 2002:a05:620a:6188:b0:93a:82a:71e5 with SMTP id af79cd13be357-93bb7703f59mr919230985a.19.1789638754220;
        Thu, 17 Sep 2026 02:52:34 -0700 (PDT)
X-Received: by 2002:a05:620a:6188:b0:93a:82a:71e5 with SMTP id af79cd13be357-93bb7703f59mr919228885a.19.1789638753876;
        Thu, 17 Sep 2026 02:52:33 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd216028sm60330255e9.7.2026.09.17.02.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:52:32 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
        linux-rt-devel@lists.linux.dev
Subject: Re: [PATCHv2] gpio: mvebu: keep resume masks within the irqchip cache
Date: Thu, 17 Sep 2026 11:52:29 +0200
Message-ID: <178963874726.7902.8784965092061133801.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915004406.115230-1-rosenp@gmail.com>
References: <20260915004406.115230-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: VNp41S-xjRzpZNXMwuQyFG4YzJf2VGbc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEzNSBTYWx0ZWRfX7/4uZ7osZYG+
 3Nmz3nXdGLdQhGN1bCWE+zG9UIQsfTL50OI1lg0Vpw4Vs83EXthVwVsxFD7nazH9/YP7AWD/EUH
 6+V0IXeLSYAiLzOEqXoVNVeKYZgLtoc=
X-Proofpoint-GUID: VNp41S-xjRzpZNXMwuQyFG4YzJf2VGbc
X-Authority-Analysis: v=2.4 cv=dOQzC+Zb c=1 sm=1 tr=0 ts=6aabb862 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hD_7jLK3eKd2lVZaDy4A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEzNSBTYWx0ZWRfX9sSjFBmk8sU5
 yey3SgBgwrfK/1kX+Dr5iiR9Qme7QDx8W2GX9XlMpCzput5QE3QSlF/NJJko7QQDDFfwNICnSba
 3JCb007D+ZXG08PolZAuzaNiZEpLiM1luWM/cNyz7YbgAfqhz2wJCUDr6WE+6iqabzk+SsBCdlI
 MxpcQprOh5Bgq3MX5b+8XPiSt8sXyOz6lRpsG/KbU3SRuzrr0zDKUMn4x8tewvLtXKpT099PSWD
 xzqSouKZrzw2kTpiVP/Qs775RIdkxWK2kAPetOvJGkr+Ho8Cct4wzBUVvbDW9OF8eKbFnQafNNY
 8rT+p0oIIuKk1TPJ7NBwoK4IMrOY7RdvQiA5ratDuPuFhXDPkwDCLx6XY5E4/0nI6oZyQyS9ntU
 XX7Va7XQk/qBEfnTyQIKzwalGrbl4ktuYpnTH6aYlcRoNW4pt7lTVm1lBBDm0iIEX7Aa5tsNNbW
 FlNjsIpFeF44M6pVjiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170135


On Mon, 14 Sep 2026 17:44:06 -0700, Rosen Penev wrote:
> mvebu_gpio_resume() writes the edge/level mask registers saved at
> suspend time straight back to hardware, bypassing the irqchip's
> mask_cache_priv.  genirq skips mask_irq() for a line it already
> considers masked, so restoring a bit in hardware that genirq thinks
> is still masked leaves that line unmasked behind genirq's back.  An
> asserted level line then has nobody to ack it, and the moment
> interrupts are re-enabled the chained handler storms, hanging resume.
> 
> [...]

Applied, thanks!

[1/1] gpio: mvebu: keep resume masks within the irqchip cache
      https://git.kernel.org/brgl/c/02af7eac17bc62a72335c1fc8c4af4471654f6cc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
