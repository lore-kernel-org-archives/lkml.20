Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AA9530DEF
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790120575; cv=none; b=HqK85QY8w0hADldZMLzsoKHE8iAdO7vzaByfQjs892k+o1GUNDdggEq2PzDcO26htwTcR0RCGvCPnXDcpbYZXgR0aTLkCTzSoGRpabyWPBhciEGmPi9JnH5Uec3S4JErsrnssTffqP9pVjsju2MQsehX31HZjZGBQAJuBMDcOTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790120575; c=relaxed/simple;
	bh=gnuHqwNNRZTj/F5sNx+WEHPxIzhx8AgoV2sb79aEbxw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=pYyjajMIz1J7os9uxl8GZxpz5VJtKLBSdRf5kc7UlXJw4OgbhsEvQPrVHXWoFA0gTUqZXClvi86N4f9TCcADEL2fMfa3UH2abado+nvCI70S65VT5K+wEwMdF3qtasUnw/mbhCEugEvo2x0WHBWe2FK/MFUm8qSokbeRqlg19kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HSDzEFGM; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HSDzEFGM"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso1943485e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790120569; x=1790725369; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gnuHqwNNRZTj/F5sNx+WEHPxIzhx8AgoV2sb79aEbxw=;
        b=HSDzEFGM2YohWr/MDjTgACY1QPYz4/ayDnN4+JXyMvv3WG6ODt+ElIit3lU0SGXh8N
         pKm49219WuLqDKO6zkx3z7n6cYy6389e9ySXqVw5Yc8HH3ib5PNZNhm1C9aI8Sy3aHZU
         qsfWmTS5Bum58vXm4KRtJ/ysfWfHqiKFcEqsx/VKMcrrI4lHoRFdnN2K1hZ1Cri5mCNN
         UrlbDr+qP7Ot53QCDhuoaI/hRg3GKOEeQ81Fw7xocHbLXr7EHCGZqDa6vsA1Wc9qDGt/
         SjwxS1EK7pu+Yv8yS7+GtgxZBKQrdKrNEv77d4u8OCtHDgcMRlu8Pb+hBacyxx2u9Icu
         TqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790120569; x=1790725369;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gnuHqwNNRZTj/F5sNx+WEHPxIzhx8AgoV2sb79aEbxw=;
        b=YSimq4ght6TE0Rx+9fZKmncsTBSuz38Im2tu3c0o5y/Zd4vXH0yJ4T+qNEbxB7s+ho
         30GpwIUWSpelIhSDdbfkvogZbgxc2P3BQf+aYkf+CtUi7ekq9ZfPdHarp1RhfTYRFU8T
         Guqny1X8feJiRr2scr2hRYP2mH6QuYxAAtzD5LS+g0CXl6Qk7OdfOuLQbzyxQhgTLCQk
         SjlBZMgKN1kUHqrFzoKrWMfuhmNVRBUw0mYWm090WRB/M1zmLhaXtHpojmP8s65vzofQ
         ogO/M7MyHkoY7xIICyew5fEDTLWvDwEbjY/uE4ZGilt+ecskZkeEIzNdBh6RnFDII81G
         BSng==
X-Forwarded-Encrypted: i=1; AKwUvBxMuVHZWrNWDlmKxa1zcEDP+Vp5n6ZVYT9QYpVZvonH0sAho+cA08j5otpPU5vcwYKsA2NdwfukZOQVYzA=@vger.kernel.org
X-Gm-Message-State: AFuF++nDtfCGm9BXejPGZUuBDsEUmYiptDUu3zkl9wXJhGzG2Pns+dOW
	8owlpWfE0ykz4ntPhdZMyS2XrA4XOmDJGar1RtynshvCe8WsEa6YSB4pyDiuWCUYq5g=
X-Gm-Gg: AYBFou2Tr6kzjahPTxhmEStTcZtLQhINtuAkdSwSVIsJ3rxBYDre9FGI1Bfa4J01kdC
	4GA8Ja2k3Pi2K08f9KxGxhMWnxqB5CE1FZX6Ne0SLr4rh9WRG0Z+QING9a0fgSpVKgaUlK9Ga3l
	MG3jemEIqT4ilNK9Wk1ORI3GGIw1sG8gggVe4nTA6D4H9Htua7jKb5TKEPtM9J94j41wIY9iUci
	1EqtY1N3H+hwPZ2/PHtKvJd+XmsbHI6QwMc3SNS199WgOd6iBFUwj9Xu0uBl95zTjaJrychaXFE
	fn94eHq9yF2bzjTYHFnj/MCS4k1udf6+9TXG5w4M1vNTOYczv7B12Ox76tdyOxANqpzedAyxfk8
	CM9I44j2R+1qMGGkenB8Mn4LcESNXVYOJ/jlyBVuIckx7fFbjWu23xGi/9H6eR9WAem0yuDoyRn
	srawYqYLHuUlrQ87lqiDA7uYbFtvJ19ZQiVl+inINHg6lG71n40H8RmPcP4m/iFnVKTGTdi6ZgQ
	2WkEC3hdd4L+eOzY7TPeAsioiBPxn9tg3WCq+67Bte6hJD6Q97hwPMnQlQ=
X-Received: by 2002:a05:600c:1d2a:b0:499:a277:e8b5 with SMTP id 5b1f17b1804b1-49fdeffce6bmr10454205e9.3.1790120569165;
        Tue, 22 Sep 2026 16:42:49 -0700 (PDT)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1c0f6csm34892415e9.3.2026.09.22.16.42.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 16:42:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 00:42:48 +0100
Message-Id: <DLM8S42Y6BG5.JH78CU9NJPIY@linaro.org>
Cc: <dmitry.baryshkov@oss.qualcomm.com>, <alexey.klimov@linaro.org>,
 <r.mereu@arduino.cc>, <srini@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Konrad
 Dybcio" <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/5] clk: qcom: fix SM6115 lpasscc register offset
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>,
 <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <andersson@kernel.org>, <konradybcio@kernel.org>,
 <sboyd@kernel.org>
X-Mailer: aerc 0.21.0
References: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
 <3a4e8d1115a46c45cb34193b6ceeb02891fdf716.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <3a4e8d1115a46c45cb34193b6ceeb02891fdf716.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>

On Tue Sep 22, 2026 at 11:11 PM BST, Srinivas Kandagatla wrote:
> For some reason we ended with incorrect register offset for soundwire tx
> controller reset and the regmap register max was also incorrect it was
> 0x1000 instead of 0x12000 which is full register range for this IP.
>
> This was somehow compenseated in DT reg property which got it working so
> far.
>
> Fix this by correcting the actual offset and max registers as per SoC
> documentation.
>
> Fixes: b076b995e225 ("clk: qcom: Add SM6115 LPASSCC")
> Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>

