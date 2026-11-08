Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169515;
	b=N98FgRLdEg1LAMBvwrixXqyrbjbK+VcCkCaGV3jzg1zOu90bSdl1xSvEFWxCYTc/e773
	 0FsrAimRpRYrlNhyScWkoEdvn/Fy4pRM0bOYFXNWlxrDgLNqhOhsPPxq5d60ngivpjujq
	 AkxKuuDKyqs0pWjAFkJS5VrGKjKiyVN6z2x45DhxT3IvVwUYlU448wJAXx0r/fqhNzk8s
	 Hx4Z1VgZE175DVw9I8c8ACPAkvI/F7+5t7ucEONHTWqAn4emtcNXkmj3UZlvQdYufwxnq
	 a+OA3P58KZYccsJvD7shtwXgJGtAH7YIWu7Nf6/xgzuMS5Rt8rw4ZCfeuxjEJKMqJTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169515;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=diX8YfPH/32D4k4+Z7sJBGqqCMJ0rwB3xowujRJs8SU=;
	b=XXQGiPPV9NN3ASOcNMbJce+wFsxPN1TYoh0eG7uZ7WZjKn6y7k+DJYEqoexSmxRH76eD
	 O3/tWn/novoAnGf8LmYLEN4GhmU4DBvnKOms1U7R31mWVI4QWKK8G16b+udrn9k8yiEXp
	 0fIg0gL76HI/lU6qVg/qAfaT8f2KKDJ+W25hApb7IP+nHBihBYRXyUn1EkZwEm6HZF2CS
	 elhVtJ3i8yem5hkiumn81Ecw1TBUKGjjFmiEGJoeIVakaFlCQLCnXgheFo7LngQaE1ICt
	 4uDu0TslvsK1JioaCjquhU6eKA2ZfA0v/Pig8XWsl1VCUg9lQQbCZLwQtja8Twzk5NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NdfEebQZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F8660826ED;
	Sun,  8 Nov 2026 20:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NdfEebQZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA59C1F00922;
	Sun,  8 Nov 2026 20:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169515;
	bh=diX8YfPH/32D4k4+Z7sJBGqqCMJ0rwB3xowujRJs8SU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NdfEebQZWMbavVNdHMdKnSwgIL/+70pPwE1UyjExPey/JmOQfz42d4I4mvM13opIJ
	 zJ0FzLWB4+PD3884Qa1R3N+OKJ2u3F9BrNiVHhZx7s232yw9S3BFbe4B9Ak79k8e5t
	 Q9Umqwpcw5iujqMmI8BcKgtvKYSSfrstESrjwM2YVcgmv3XA/pIC/paOuxV7RnQdn6
	 EzqMvw2ZWH0xtK7sMjg33epHmbW/g3Hpw6WPsQSoXtQ3+gB4kACpZ0ktn+MOgZtNyQ
	 N8HcWjEKKzZDTqIugeioMmDWOLTTI+HiEjVOKWgosRBmPOpYUKV+Og4137z7zGjm5W
	 3uU1+HvWJhNmw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Deng <wei.deng@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_chezhou@quicinc.com,
	cheng.jiang@oss.qualcomm.com,
	shuai.zhang@oss.qualcomm.com,
	jinwang.li@oss.qualcomm.com,
	xiuzhuo.shang@oss.qualcomm.com,
	mengshi.wu@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: monaco-ac-evk: Describe the PCIe M.2 Key E connector
Date: Sun,  8 Nov 2026 14:21:35 -0600
Message-ID: <179416929455.628393.15783461778192403623.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021104709.1428234-1-wei.deng@oss.qualcomm.com>
References: <20261021104709.1428234-1-wei.deng@oss.qualcomm.com>
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


On Wed, 21 Oct 2026 16:17:09 +0530, Wei Deng wrote:
> The Monaco AC EVK has a PCIe M.2 Mechanical Key E connector to
> connect wireless connectivity cards over PCIe and UART interfaces. Hence,
> describe the connector node and link it with the PCIe 0 Root Port and
> UART2 nodes through graph port/endpoint.
> 
> The port/endpoint nodes are defined inline in the board file rather
> than as empty anchor nodes in the SoC DTSI, so that
> of_graph_is_present() only returns true for boards that have an M.2
> Key E connector present, preventing unintended pwrseq probe on boards
> with soldered wireless chips (e.g. qcs8300-ride).
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: monaco-ac-evk: Describe the PCIe M.2 Key E connector
      commit: 49e065a20345c2f98afd1ed57865c0fc40f7437c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
