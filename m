Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43812483804;
	Tue, 29 Sep 2026 03:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651805; cv=none; b=Bq9d++ZTmHS8xll9QVBcB3zxqNAeIDe75KVtvt0+77zHLL882Z21ACii+FbOu7oI4qK4icpKljp77KeYTTURpNy7GLhg2iiVavAlEVhmWXPai/7d/8Xjffva6BKYR+9/G/wsHKlPFaq8BNetiRkCVre7e1ogD43uPsNf8ibZwIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651805; c=relaxed/simple;
	bh=Xt5gXFBQUC31VMLaJb32qHrL8EuS8IIjD2UeXTAndOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h4NtFImvvSLtqSSGgFe2X6cRg4T8c1Qw/9mIeBD/q7HRxecbxyvF8dvW8xSCp02miBmJNu/lBZ0oUlSkji6slJXI3cwx/k+QoTX98QZLGkYIJCDaPvDl60iVzhWmhUFVSPKyS3f/L6cBqKyq63iI5OIU1gi5TOPD1oHUVdHxFcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AHeVLXfu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AHeVLXfu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7AD51F00893;
	Tue, 29 Sep 2026 03:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651802;
	bh=b5FulES4i6yhqgzEHCkKERkQxQEAnPXCKwF7i6iYVNQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AHeVLXfunJ3cc5q+DZmjIO+DdT6dUQ1uq+Wqc48mXAmjPWtklpQoA3AQzmAWOSVJ/
	 pUGRDh9KKhe6VSZdovhsHe8EDJa3NKpBoq5m393OOETi/jUI7IODBib73Ym7NPy75F
	 OisX/BcRJnXD9B9GapfGLdBDZzKj1qXGVSpy9YaHBI8DetMqmq3ueCf3TTewvMV7Qf
	 rZsW/9CInNWrBmoEmOKfXyXZVQmizsPsWsYgulz2+nEBB/A951dr7APraYG4DD9xa9
	 R+7yHqLrT8GT8dsQJwZgwoIJgXkMJXjD3Y0ZPLnotgj09Te2zsWWYesW1t41G8YZKw
	 QumDZBKlXG/JA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Xin Liu <xin.liu@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Yijie Yang <yijie.yang@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tingwei.zhang@oss.qualcomm.com,
	jie.gan@oss.qualcomm.com,
	guodong.xu@oss.qualcomm.com
Subject: Re: [PATCH v3 0/3] arm64: dts: qcom: PS8830 retimer clock fixes and typec0 enablement
Date: Mon, 28 Sep 2026 22:15:26 -0500
Message-ID: <179065171011.2673486.8498061488823134961.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914101233.981643-1-xin.liu@oss.qualcomm.com>
References: <20260914101233.981643-1-xin.liu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 14 Sep 2026 03:12:27 -0700, Xin Liu wrote:
> The Hamoa IoT EVK hardware design uses a Parade PS8830 retimer on
> I2C3 for USB Type-C port 0. Describe the retimer and route typec0
> through it to enable USB 3.0 SuperSpeed and DisplayPort Alt Mode.
> 
> Compared with v2, two new patches (1/3 and 2/3) are added. During the
> v2 review [1], Konrad pointed out a suspicious clock reference. Further
> checking confirmed that every PS8830 retimer on both Purwa and Hamoa
> has its own on-board 25 MHz crystal wired to its XI/XO pins, so the
> existing clock properties in the DTS are wrong and should be fixed.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: purwa-iot-evk: use on-board crystal for PS8830 retimers
      commit: bda6d233a6ea408817fa5fb5727d11fa2349d9a5
[2/3] arm64: dts: qcom: hamoa-iot-evk: use on-board crystal for PS8830 retimers
      commit: 723ce02feb131a81224a281872028d584b69b0ca
[3/3] arm64: dts: qcom: hamoa-iot-evk: switch typec0 to PS8830 retimer
      commit: b33a372231750a87fc2d1e5c5cba228c0ad19db5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
