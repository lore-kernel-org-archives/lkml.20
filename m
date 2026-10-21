Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575850;
	b=Ohozf4KXmhm+r62eLsqdprpeH5/zSFcO/IcydTWSTp+Q/ZmGS0AS6mz0YwMZerLrlQfC
	 uEyw2pysJsvSSb88Zz14GpajcDP9UCQNBpy73wEnAElrNFZo/cxcsxDa1PRKp05X5Qnss
	 10CVuG5rRql1gtPWvjXHnrHIzAqvHsByxxFNJ1Dw34dXXXwbyDu5OxhrvDMoDKOeI6QEL
	 4TOa+6ommJsQe9WLiPSF8MP+hof4iPBMdsJmEBZR0CnJxzl4wa5S53ZaYUKpvUTKK/2Pc
	 dRvL913FkkhwXrGNGVgXuaQTB+8XUy1MU0vCzhsCREvQqgF4ORHd6e4iE6mWJmc1LJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575850;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=5GqSQ0QCihZuBCVkqsf4LxXGXNiQ71AyM2cHDQFk7c8=;
	b=GK7T0dlNY0U0QnuS4+j8RGsJYJYfzpO7vnS1HaGsRetO6EI74wsS286IMMW+2K0qk2CL
	 w3Oy9LAa+s1q1+pdDNY+FyyI36psANHYDRbmnHZ0VIK11FjEan/3Bfsy6U/AwL3gKgnAG
	 vEt9/vmokxofV1jalPgZzBPLewKHLPtWiBKMqihidIymOprUDCaOA0g4A5FFQSiuHhWDs
	 tB/1NJUHkrinpHjgbRykJfqTIWAA+oiVwVPKv2NLMqn1s7bF9QuKLpvRXVYkMMse3PSfp
	 m8ox7Yx1Ha7x7cqDj4OIGhegtER2VA/Lv1Y0WnRXspnyrMiOXrk8xWVpl3gMGokFFMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="L8DXu5/2";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11479606A326
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L8DXu5/2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 999791F000CB
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792575849;
	bh=5GqSQ0QCihZuBCVkqsf4LxXGXNiQ71AyM2cHDQFk7c8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=L8DXu5/2tjvqRFM1X2jp3UbAQmXndkgTfUcy5OrYVbK+ioE4XQSg1NT0g/WfBbM7+
	 q32o0AOy+PF+l1sJGfIMj35gyQ3DzBKXiPisbLIwwGkhbQzMFiAsx5XTWyMB5tj63g
	 TjVvt11qe6jUKUBBDZug33DtXj/Nd88D0Yne2cYYHFbkFTewcfrQvfNNjRHN2uJky4
	 2SN4o9dnqQFJMJqWJDUoRTw1ZyRTPSW7jX3546Pg2JWgq+4vVASmRO+FLy4JypE7dU
	 b19tQSXY5EKQwiMFZN6ObemrHA3hHVPdpr8QoWrnF4EUvmEPV1Lu2QYaiRIPIOtPpB
	 CJPIBaT9uE76A==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5ba3ac592faso532861e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:44:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwTP/brbiQcxX+pIIwNB7Xu1qmG9thSzr7kAFUTWHVWW4o4VtbAa3599PxpBJ93CBo3jRFVLJm7Rfh6hfE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRw1bQKc+fyBs2y+VlfgPacoMDAEtBwQKI/YbpsFGMBEMbCcKV
	q9fxwSKW2bcnC1oDWsBWWndYJN7HFSaUg6Lni4h0SWp9eW8d6WsHRAVtjWjXlE5V0zzfXofyhqe
	9ZmkzEP6c22QZIYjk66P9ZTadUeV++Ovd5RoB4ENOhw==
X-Received: by 2002:a05:6512:33c8:b0:5b6:1a7c:59dc with SMTP id
 2adb3069b0e04-5bfa1d08db4mr634089e87.54.1792575848401; Wed, 21 Oct 2026
 02:44:08 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 05:44:05 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 05:44:05 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261021073633.2163128-3-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com> <20261021073633.2163128-3-shengchao.guo@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 05:44:05 -0400
X-Gmail-Original-Message-ID: <CAMRc=Me0T-5hNbT8ksqrjQpQ=21GAb_26Vqup87etSO=QtCovQ@mail.gmail.com>
X-Gm-Features: AclHuK_9YGg_X7146bJJdqhZHqrsMwLmX75q5uNTn98-K7ckzWhfGKrFDJ1LtLQ
Message-ID: <CAMRc=Me0T-5hNbT8ksqrjQpQ=21GAb_26Vqup87etSO=QtCovQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 2/5] arm64: dts: qcom: nord: Add gpr node
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, 
	Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026 09:36:30 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>
> Add the GPR (Generic Packet Router) node to the nord SoC DTSI along
> with the APM (Audio Process Manager) and PRM (Proxy Resource Manager)
> audio services. These nodes are required by the Q6APM audio stack to
> route audio packets between the application processor and the DSP.
>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
