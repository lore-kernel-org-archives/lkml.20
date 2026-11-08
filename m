Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169340;
	b=W2TfUKrImHHfh2MwZWbdqpNRXzORR3D7hEB4DaHfQCdMWs5ChMlDIxRGblR0oKd8LfIv
	 uLHULGWdfv0YiLRg9/zYe2FL+zeRt3tprqmwialTGaHMZEqCEdb1i5iWzt9XFFU8pWd7L
	 bdJDOva1gxqDm3IMw6zViUgrH+KrEWuS6aD1jS9X9ksBcbyn7fH1CWhjaAQX46D6kpym9
	 PaD4ct61v7+noDUBkJBFZVH3bmkyWNR8FSI/6PXI4xDmyFOCEhUuIjCKKj75UiZLB4A8N
	 dLov0M69ch54HP5cbZqaF8dDstBA8SnK3DQVHPrhMEH1mmitIGmU5A7/mtUipeGXADg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169340;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=L0ADe7WXOQa7Uf1HfwplJh1EZvR72jfcEhBUCkhKO+8=;
	b=vK25rZ0LQxQ/oFyCpChARCNd0m/y3A4RmRIZtivRmE84cd95xgLJu0P6u0IZOSzVFjtE
	 D6Z+Pth2JOWcx9OOl7f81qOKjUpslK2D/bjDQFEk6H8p7d/bLNpBzycvT/SB+NHT76N7A
	 laxxJYvvqbRv2BSGNjq4Q7Jlma6XuxhdQo2nbFG0Vxat2IsEaLO9tTx+kc0DA3X9rb8se
	 TUA3vtTSWqqRpFaCvDSwTxkS1M5Wz/UWwwUKCMFoE/sDwSYsm97Y9eqd2JdRZuhYYI8Z6
	 DSimYJLnY2CCLp2jj7xe6Xsoa4e8n0SQvl9T61VrVZW3kVStV7C7DlwMmXGrIx6f1qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IiYhXfmZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AB4606D805;
	Sun,  8 Nov 2026 20:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IiYhXfmZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30CE21F00906;
	Sun,  8 Nov 2026 20:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169340;
	bh=L0ADe7WXOQa7Uf1HfwplJh1EZvR72jfcEhBUCkhKO+8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IiYhXfmZ8lQbWXGkVn3BlePovfcHHHz2FsB5EWb/3YhoIQ8pi8TNZih6R7m+nn2Ea
	 N9z9XO0mMt/CELizDLzncotBtiz6uDEKXff9tkjWAmr3myEhh5oJqupao+Vb9StLlh
	 +8X7S6iXuCGz4qDe0doFvwSSiTh87ux/EegKsJcdkUhlBt0t5dHNMBoKxP5kTLB5TC
	 iLR5UM2jznxFbRne+gO5WOxMl63F4SLf7zj+oY6t/ILDcFJSpQFudbtDTPEYiKsIYu
	 KbqdEhJh2eSwRejBoRqna5EZd30JC/dXkRjAQlw9RdzczoDe1XF/BODiEBoCZ9bctC
	 2E9qsGdZEeYPQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable gpi_dma0
Date: Sun,  8 Nov 2026 14:19:32 -0600
Message-ID: <179416929411.628393.10081579455491465449.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016-beryllium-gpi-dma-v1-1-76ade615c571@ixit.cz>
References: <20261016-beryllium-gpi-dma-v1-1-76ade615c571@ixit.cz>
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


On Fri, 16 Oct 2026 20:38:16 +0200, David Heidelberg wrote:
> Used by not yet introduced tas2559 codec connected to the i2c5.

Applied, thanks!

[1/1] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable gpi_dma0
      commit: ecd550f1a9feceb4f2881d6da9bb55a6b388bef3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
