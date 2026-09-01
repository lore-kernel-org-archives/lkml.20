Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9741C3FD96B;
	Tue,  1 Sep 2026 02:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788228621; cv=none; b=humI0fBRSSz8NEZktPpzl6TwEAqEY261+ybmZGFlWeq/ytrbp9b5d3tyLTyzMuMiJYdy9vFbnkcpn6JKH29VzZDUP5yXpv4FSixTDGdsPa4ODQ38z4pl+fb7v3NoTx2OaJwDzmf+S1UkETtQUU7cXz0oi26vPB41IObXepCWxdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788228621; c=relaxed/simple;
	bh=RsYztL2A3RTDALVXc3ebS0uX2Wy/mYkdp3u045ucYug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h0EaRrVEvr206G5fC+WoEVpgMKgGiM3RyxAmHGighMH/H/K05/RRa/ApUvsuXP6ZG5O4X7Hp0Qa9BbgDyqNNHO4A+IT6/HyWHh9a4NrMGP3S4caaeZjUMe0/5sciqrC+4v+s3hCyKnbg9qJdqRe/pwISICtVB8Weri0LMyE8Gz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V4zpdbBS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V4zpdbBS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 379BD1F0155C;
	Tue,  1 Sep 2026 02:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788228600;
	bh=Q38ppnsRCg+QgWzcPnKe7cYKeUUIuSpA8ILz1z4F2Wc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=V4zpdbBS84wfKssNU8dsHMHsmAQFbTa6I5/SdOvJT66phstK8ZOj2CHlE9uCUz292
	 U1L27c5EGL0D3N0GjpsFu/K0TJtNCbJ5AHiJFF46ykRvLBEPT+kkzbX4NhA5tQ05to
	 7zQOyP8oAZFoI/6iEkJiwcjnJfjdiwOEMzC6gC6QoRUPB5UPO469OlkjmBF4yT+gKk
	 P4qZndXQYOyIpWKgzAW9533fbE5ySLjpe47M/NrWLwUNZS92zRsQK/l2/tznNHHvYx
	 P418ojgi5PhD6cLNWTFkaH0NNYzkrArxdjI4ngifH9DdHl4nkXgzvDvp04W9S9kU0o
	 qrEHHAbf5nbeg==
From: Bjorn Andersson <andersson@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	Raag Jadav <raag.jadav@intel.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v2] soc: qcom: apr: Drop unused apr_device_id
Date: Mon, 31 Aug 2026 21:09:34 -0500
Message-ID: <178822856247.1835959.5448297814131514478.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <e8b352f33ae38df3616dc157c1cafd13d49c5e3e.1784554037.git.u.kleine-koenig@baylibre.com>
References: <e8b352f33ae38df3616dc157c1cafd13d49c5e3e.1784554037.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 20 Jul 2026 15:33:46 +0200, Uwe Kleine-König (The Capable Hub) wrote:
> apr_device_id was introduced in commit 6adba21eb434 ("soc: qcom: Add APR
> bus driver") in 2018, and since then not a single driver made use of it.
> 
> So drop the unused id_table pointer from struct apr_driver and move
> APR_NAME_SIZE to the apr header which still has a usage of it.
> 
> Note that with the id_table being NULL apr_device_match() degrades to just
> of_driver_match_device(), so replace this callback accordingly.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: apr: Drop unused apr_device_id
      commit: 06cb5c457dd57ad1960f7557c67976de4afa79e4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
