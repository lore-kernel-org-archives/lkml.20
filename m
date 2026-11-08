Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169351;
	b=y++ixHUpXk0EAG6Gbo2H9UdCPvmIDuipfE+z4FdFpG2FU0uI/8VHUfPnX1zNowWLE+nG
	 rWsCgGws5f12KvCxtOw2zKTdmczXi07JBOsazediruWBpa89MLqlIdZw6T6XSEqbGW/5b
	 5gYET2xIrQieG1ZhPCvCMCkIIoH6uYrJjVkv8kqOwh45lKImA8xlsyHGY1psSpYTJIVG7
	 oyfX4Y3glebNS425013G4NDenzy7MVQ7pkQYf/w2czi7649hhYVqaoJtAo+CbpDQa0DMq
	 h29BrpubnkeOAMGUjwR1CnPWOR1MboyvvRPU5wccs1jIBI2O5hUaI4DC/p21X3SzCgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169351;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=SsvAPFW7IU/8Can7RL0UQqVDVWEur/qiJ/Sna8vvZcQ=;
	b=F0hI2G97xTHXV4sTNtl3YRBNYurQwDvHqFifMCjNJBG40OjCSve4j7pcyUXoe9yDfkyi
	 lriKG/Jrw+32TLhqRcD39znjBwWbS1wRJe24Qc/JfXcsh/vd0InbZ4i5ODlEhi9ZdEbri
	 3sD8adVu3TLzGmrcT9vyIi5A+MuxLw9RxITK7jiNmgHyG9BHTfvHpfHT/jDMqPlqzNxro
	 kuvwHHupasmMyt5eJVKIOu/2rVrq23xbt1hFFL4QB7qfiuF46kwwh+K9mBCc4A9xmI5MJ
	 DiVut5fDxyMv6dYJ3rfPoNLAZ9P/lhaLKfa9EYW10msqqvGc8bSSo162M2BdaooOXZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y1NHbKl5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C7560A3832;
	Sun,  8 Nov 2026 20:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y1NHbKl5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 999491F008A1;
	Sun,  8 Nov 2026 20:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169351;
	bh=SsvAPFW7IU/8Can7RL0UQqVDVWEur/qiJ/Sna8vvZcQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Y1NHbKl5s9AAZzshbEd9qhjR6QkHqt2B+t4TCg2sob4/1b+06pl3WJ+o1KA/hU9Pu
	 d/seU2fxFrDFzZOyRYH3VUJyELxrwddSxoiX9sPAqYL9N4MfLkm1cS5FKNPvj0AwY5
	 oteG6xyYgIyO11+UoSV+W6gEADZQ+VU8oCE+CQwj45tim1MohXWgyHrgC7Q7pyN/Xu
	 I8NEdVz0bElTJSlI930m/7+hHrqg38J+v1HI4u2ePznjM2SQWFOSIm7K6Z7NN5v4q4
	 aN4q/d1JT6VQfxArspABVN/jAL9AqjhJFYrEll5Q+DRk5S9FgQ4wiB8wplGqAlOiUV
	 L7RcPNj/kSytQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
	Chenna Kesava Raju <quic_chennak@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mahima Bhattaram <mbhattar@qti.qualcomm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur: Fix fastrpc compute-cb reg values for cdsp
Date: Sun,  8 Nov 2026 14:19:38 -0600
Message-ID: <179416929203.628393.12432179393225108336.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923-glymur-dtfix-v2-1-a4b1928e0c72@oss.qualcomm.com>
References: <20260923-glymur-dtfix-v2-1-a4b1928e0c72@oss.qualcomm.com>
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


On Wed, 23 Sep 2026 09:29:39 +0530, Ekansh Gupta wrote:
> The reg value of a compute-cb node must match the SID (the lower
> nibble of its IOMMU stream ID) it is associated with. In the cdsp
> fastrpc node, compute-cb@10, compute-cb@11 and compute-cb@12 were
> mistakenly given reg values of 10, 11 and 12 instead of 12, 13 and
> 14, which don't match their SIDs and leads to SMMU translation errors.
> Fix the reg values, and rename the nodes accordingly.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: glymur: Fix fastrpc compute-cb reg values for cdsp
      commit: 59cfafdd42611fe446c400e692814f8acaed8021

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
