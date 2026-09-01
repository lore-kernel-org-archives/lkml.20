Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA3541DDE1;
	Tue,  1 Sep 2026 02:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788228611; cv=none; b=qNrmG29GkJ4vgov9b3yGJySiKv/0MaI0gPlYnzyr4nZ1DWZToyXRyJZ+YuWngU6lMYKvsPoNlDydxyXvpmpAex4ozvDSEQhP9yWlv7PmV8agmdGdMYTMNFMQhBkZkV6HN/cX9hBcM7Q7laerSnnbdnQZRLb9os8APQtKu/3Ligw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788228611; c=relaxed/simple;
	bh=DhgmYUYlM7It7mY3oAhS1d3edT1k2UQOJVl75n9rN/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TjvjhnKJMuHqCAb+S58lgsaPgxPYfdHeN91S1FC6SaymET+aohsbmxTnwf6Vf1G3eIFmlbURiK0RpZEj57ZiitRw1DHIJc4ldsPiNxdwEsH8bOtGlKLU/+VOdGqvO51sRwwQyjFkH1uQBMkq0O5dCG8xIkBSl2rA+CqbcXOIPm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XX1o+/cM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XX1o+/cM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C0F41F0155D;
	Tue,  1 Sep 2026 02:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788228601;
	bh=bdgtnhbUocWnqktpyw/UdsqHzhONI8oaD7C5lqWrXY0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XX1o+/cMRAdkWcckae/NkKaWnv2rwojhUg/RBF2TCcyRjXeaw+u8iRAzP3Xp2XDVd
	 y2HpZ8BFEXbJf3VLOIoR58CTkOdDKsUjjN7MJkCXghxggF4pjHVL0miiHgq8JbqclF
	 2VzQ7el58yjatdxMUVRmrf1yVta0stwU8W0RJLQqEaq/SFgbC6b4lXmfwnh5ydz7YT
	 f5K2avrGb9zCdM46T5Itxd7QQYzGQe6Jqk9u+pDECuOFN1rUU1BICloIQkeQNj0TtP
	 5COtkuanzF/wyOwlMZpuXv8uB54cEtd3eIZV/9tMLVHoKXzE0MfBJEBK6l8Tavr8ju
	 R0IUN8OXrYUNw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] soc: qcom: ubwc: Add configuration for hawi and maili
Date: Mon, 31 Aug 2026 21:09:36 -0500
Message-ID: <178822856281.1835959.15017287662792408601.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812-ubwc_for_hawi_maili-v1-0-c29edecb3bd8@oss.qualcomm.com>
References: <20260812-ubwc_for_hawi_maili-v1-0-c29edecb3bd8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 12 Aug 2026 14:28:59 +0800, Wangao Wang wrote:
> Add UBWC configurations for the hawi and maili platforms.
> 
> 

Applied, thanks!

[1/2] soc: qcom: ubwc: Add configuration for Hawi
      commit: 8171a509ec68c722afcb889d696555e0d1d9db9c
[2/2] soc: qcom: ubwc: Add configuration for Maili
      commit: 5c6cd312c29f0527ed832d99f0c89bac097b62bd

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
