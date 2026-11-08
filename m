Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169320;
	b=pXldAYE+j84H2wqO3rFAvHIY0jGdGpe0Kb57k/bMDTsUA/tqvNwloeznoRigauMYAzQX
	 0NuT9APSvvBgrCBBegsdXePUeh1AD6XHzw+FzP661nvz4kEaCds4Ont5d8sC83GLNPtG6
	 W5SUOaJLvsdHKxbLSsu7N6iU7B36f4WBj5MaKzJuCsogt4g+7Q2FcA/QyRK7iLl0wJa8w
	 33FPz/areY1955Ol+clnm5c8ENT1XzZiex4WbF0V3Wwjm4YHn5MO3f7nxUxlmaOqADjvX
	 /065zPO8fd6aXy41umW3D/coTMlvWs1kl6CIHVDqF2Vhm7o8CmKvLA+z48dYXAQnowg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169320;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=l7neh/9HoHMNz8EuywMxQzyUFGOTrut+abX2bqgYmu4=;
	b=OUozGhktobRsOWsIJlZXolvkYFBcyX2a4H5WQzj3YZ0QErIUYvl+d3LwCJ+rCJy2H4VE
	 u5tiM/Yc9bGbs/eDf1JdyzTlDzd12eWLxEMK+uOivIRihyGe0oTGMtk7HuBWYOfeSn2+I
	 GKs/PyqZAdosAN2u1eHwMC7kvIoj3hd+9eslr+dvs2NPZX81KemGVJBoe9aqCCbkv0jvb
	 ZC8IqFri19o1JRZcAbVTQhN37mDoLCMNRi09Xz2KmZo1i3dMNniFTnOZfsfodj0heHNgX
	 HjZ8ij3R5TFefPl82RkVngFqFaX19s0+REY38QSCiMZ4qDWaJMWHQOWma8PRU/XNIwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z0d9BiVh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBDB606D801;
	Sun,  8 Nov 2026 20:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z0d9BiVh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 949351F0092A;
	Sun,  8 Nov 2026 20:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169319;
	bh=l7neh/9HoHMNz8EuywMxQzyUFGOTrut+abX2bqgYmu4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Z0d9BiVhPaZAG6HNsNfZPcqX5TOcm2xasfSht7LWcT7g8QrybzH4Zr+fxq1fnaA6B
	 9FDbXMapXzkNBR3k9fid2Bk1/J3Uu4zfOI1oP8SO1QzywW0/yEVkqiSO4VcDYD7oRS
	 /4n7mAuN2yKQfBLEHLzbde43xDjs7SUAUELrfNGEl8GOJoceqXYpWW8ohU6HsB532G
	 zFZqIW4iQYK6Fhrx4ENzWtewn6h0H6mqE9JVAuwqcO9Ea5HXMkt04ENAv3TGgW4hzp
	 o9j0KTW0V6lRF3rBsM3N0VonIgL/Kb9ZdkfP6S3sSww1eEcMuH7ZMzlY1wkaP65jnX
	 E2luvafwaEuBA==
From: Bjorn Andersson <andersson@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-sa8775p: Use retention for USB power domains
Date: Sun,  8 Nov 2026 14:19:17 -0600
Message-ID: <179416929209.628393.10279991163222834451.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261106093722.3261172-1-akash.kumar@oss.qualcomm.com>
References: <20261106093722.3261172-1-akash.kumar@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 06 Nov 2026 15:07:06 +0530, Akash Kumar wrote:
> The USB subsystem does not expect to lose its state on suspend:
> 
>   xhci-hcd xhci-hcd.1.auto: xHC error in resume, USBSTS 0x401, Reinit
>   usb usb1: root hub lost power or was reset
> 
> To maintain state during suspend, the relevant GDSCs need to stay in
> retention mode, like they do on other similar SoCs. Change the mode to
> PWRSTS_RET_ON to fix.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: gcc-sa8775p: Use retention for USB power domains
      commit: 3c985f4d691286f083c08f90e2b6834eef007607

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
