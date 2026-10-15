Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F95D2F39B5
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792034321; cv=none; b=bkribXji7lF7jzwvtGmOlA3zlA0DT8HU4N5kxjrn7mHBIWTMfWRF/blpspzB771pPkBhckxn0WToFmjI97BhN4SdTVFvws7XxGwubUB5I1yOUQ6QKUgI5HqWXwPD8KJjgJ0A+aqfRZJZUvMS+esTDfOtdPaozM0FcG2NPEVqNgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792034321; c=relaxed/simple;
	bh=ICJMGi7k45ouJVmmewL0jQoBvB0Jes1qUkkB0XA129I=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=OP2lR8Md94VziZ6Gj4l6qQvuBS+Sa0YSHjLjvR1BbcilJPR5ffBquZoEeGmzc56iqzyRdseuH9+TLnOXnOZuP5vhwn8rfriUTKPB3lRlOnzxp58ug2y00oV7x++BZLbi5XyGA8cf9krrfq1Dx8l+CPN+wSn7UpWdY2+hxzSioxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c5AAQinV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c5AAQinV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC0CF1F000C4;
	Thu, 15 Oct 2026 03:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792034319;
	bh=ICJMGi7k45ouJVmmewL0jQoBvB0Jes1qUkkB0XA129I=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=c5AAQinVlS9Y7x0D5BRmr4f+HvQfNxw8I6C+jYavRCSurIALbDOR7Yp9313tyc8Jv
	 ykEEDmcM3uO3Fml8cOLiMidqCixXUompWeWt3P9It6vOKtGik9THSN5Xw7krxIa75l
	 a0ducORqGlxU9HYuXvokGxwJCoLjbqOBpftJqwoUn/1SNt6AbUaglrb2BPTAdzD3qf
	 mU5Yw6Cxcykbvb2OCCbAviqo4eQWo56bCXTNFzp96woJNKHxVW52zR1XBvU7/+/VVf
	 UhWJlYjxd/nuQxqZr+lJR20/SyqmWdhkt7ro5BRBBNhdxnpDlQ6L66WdTJi+xi+xOF
	 XzZVXVlvRdKmA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260917155037.2161027-1-vulab@iscas.ac.cn>
References: <20260917155037.2161027-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] spmi: mtk-pmif: Fix clock reference leak in mtk_spmi_bus_probe()
From: Stephen Boyd <sboyd@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, nfraprado@collabora.com, Wentao Liang <vulab@iscas.ac.cn>
To: Wentao Liang <vulab@iscas.ac.cn>, angelogioacchino.delregno@collabora.com
Date: Wed, 14 Oct 2026 20:05:44 -0700
Message-ID: <179203354462.5720.6867904221683901576@localhost.localdomain>
User-Agent: alot/0.12

Quoting Wentao Liang (2026-09-17 08:50:37)
> of_clk_get_by_name() returns a reference that must be released with
> clk_put(). If the lookup of a later clock fails, the function returns
> without releasing the clocks that were already obtained. Put those
> clocks before returning.
>=20
> Fixes: 078117963b2c ("spmi: mtk-pmif: Add multi-bus support for SPMI 2.0")
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---

Applied to spmi-next
