Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169317;
	b=hkiJQMrg4iW/yCSxgmSquF0/9FBGKDE77Of0Kv/rc6xMDJ7RNbbAh/GAak5eUXKoCJu9
	 5t5vF3tb3UVtaZk2q/m//nEXby5Q9KEO7O/tb3B/QpkCgJTZWTewJ1wIuu0b3jYifRmQe
	 erQe2nhrhnH8hxFMGDO1x06JogFVSbh/5/PkS6FXQnOQftyYdJaKFSXHpR5g55eozlsYx
	 En+4OVBnk15cPJ2MPp7swkQJaewUU2bPA/IKvw6k0X+rUBwBbD+LM+EauqcDnuTI3IO1R
	 f/WJVnPj0oiG/9Ye1leXKN2VWfocJkKaSVEWjk5SLwAzda0Vs6AJO3Wt4ugbNKCqv0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169317;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=H5sXEn3/kbW3+jdPR0Bjw7uipaYsYR05IMcAEou1yyc=;
	b=O4vGSbsGBTNlMXfwFfV9U+QRiXFHfGkvNpjcDkvLyH2ZDVXQMh9Z325Xw2ivwymk9xrw
	 16D6JYFFS6seClxqxmmgrKLBOiMaxSmsG1H/shUTb+Xnc4w53iyEAVFH3zumPF5i11Vlk
	 I1uO7EebgD/qAlrgJy91baxDXxaayFOmK+3vMDmL7ioMA/SUEDtnbLhxtIF4e6M+Tpdxj
	 /O/gN7C6vFawR2Oe2ebxFfcFzVI8rSsdjefpmRso+bKXQluFPgJjjhKvfvGgK8eVQxn4D
	 ijuckmZwQozM9ErfiZ1mbshd5PYArpqKTYAM0HSRRRRqPa7+CMzxjZI5dmUNhYpKb8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="E22/IWoh";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F6E606D81C;
	Sun,  8 Nov 2026 20:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E22/IWoh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0796B1F008AB;
	Sun,  8 Nov 2026 20:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169316;
	bh=H5sXEn3/kbW3+jdPR0Bjw7uipaYsYR05IMcAEou1yyc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=E22/IWohioiH3pLenLjk8ExmGVtHOxWSf0yng19+lhPF0WzI3nFreuazXCYB9VtYe
	 6TpJBI1hPmJXVNd8FYz/+sI1DOXf3PwrbqFnjI+rL6Dl7T2V9MbGeqGYFYgRL7RBb+
	 BZ82qcweRsxMupv9MfBtj/YPz4cCyptlfoA+2rV6kVTNGY+O6hdcF+qpMM5N0YLGTf
	 T/OjftPdWTQMu7i+F8jL1/B/CYTjCRTS/fWb4knHABwYQIIYQ/PwVyJrpeixqEENVv
	 UxnSb4QpxGmg5hWAKbVrY12EBtI0WwYxPibrylzpHd7Ye/IFthqSebLOyhdiIo2QPX
	 HA1COZDH/yS8A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Albert Esteve <aesteve@redhat.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sarannya S <sarannya.s@oss.qualcomm.com>,
	Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>,
	Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Tony Truong <tony.truong@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/4] Add automotive SMEM hardening for Qualcomm platforms
Date: Sun,  8 Nov 2026 14:19:15 -0600
Message-ID: <179416929497.628393.17299011233332755876.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261028-port-smem-v5-0-121257d490b5@redhat.com>
References: <20261028-port-smem-v5-0-121257d490b5@redhat.com>
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


On Wed, 28 Oct 2026 10:33:47 +0100, Albert Esteve wrote:
> The Qualcomm SMEM driver manages shared memory partitions used for
> inter-processor communication on Qualcomm SoCs, including the
> automotive SA8775P platform. Vendor trees carry additional validation
> and partition-enumeration logic that is not yet present in master.
> 
> Patch 1 adds IN_PARTITION_RANGE() for pointer+size checks against a region.
> 
> [...]

Applied, thanks!

[1/4] soc: qcom: smem: add IN_PARTITION_RANGE helper
      commit: 784f49db7a33d5feda0ff1d4200c1653cad0114a
[2/4] soc: qcom: smem: validate private entry list walks
      commit: eafcc97814aedea2cd6c3e385f8832cc4e6e3ec9
[3/4] soc: qcom: smem: validate private item payloads
      commit: 8815169259ad002577a7053212760f9c2490ae4a
[4/4] soc: qcom: smem: ignore multi remote host partitions
      commit: 21a10ab8beccb2abd2dbf51f727160bb991c731e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
