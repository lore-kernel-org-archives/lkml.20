Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793790520;
	b=HkTKL3ZriywkgxyoT5ICK/lc8DUrMGgx7uh5ZzfkdILMOh5fn7275otRUYjecGcBXqW8
	 1D58pjusai4oKRn7HEWPIq5gCinmzxn7Xol2gK1PbBPUMXdBFA4vTzQO3Sx8l9TZnu43s
	 kep61vckJqoWSVwT9j0gNPIxc5P9Sd4upJzr1mM2e+HfLwZBKXlL6FhrtC7Dhw7GpKkN/
	 6RFTQphOw0P8sORTEilJoTqu4ftnU/0jlFibH3lvK33kyzOVMLiNNjQ6/OULewxykYFtq
	 xAfqfo1S3pUCcJ6vvI3UuGDsv7JS/GoTYKebZBfBcGExJspGqIR1EWIoergV0q+w14Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790520;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=nqSqo3pEw1u92shsfe+adVghkfzPO8m64RinvGZAuZg=;
	b=zCpRm+Tg78/TNIZl8qYXXk3M5e+ywZ9oDVUPtAvdRsNdQhS5oXGddxK+YqdfIo2RkFk9
	 FuVoHNInlrVRtxkWCbaPSexrbDWENX1hOJ93J4x9Bx5w9be0mmhMNmwrTyfWsBHPrw4Yn
	 4jEtlXtgmqY9zDq0n5osdktjgNpOZvbzVhKrh3VFcP16/hxNQc+atTA4wcuhZwR1adk35
	 J7Spq5HPmv09Q4/Wc6J59l1wyQlOMZODl/0Bc4QcHe85zxk+0hb4rWQ2C+uCvYbNjlwDj
	 ck6ANNneB4f6xkm3luwQldhp/MqotODIdW0P5NT873fJoMGEM9gyqwAf2xaouXUZsZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IzFo7zbW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9F4606A32E;
	Wed,  4 Nov 2026 11:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IzFo7zbW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 396B11F00A17;
	Wed,  4 Nov 2026 11:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793790519;
	bh=nqSqo3pEw1u92shsfe+adVghkfzPO8m64RinvGZAuZg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=IzFo7zbWGgBEgelPJ4LaN4WYA6HyZarqqh715wxjZwtQHGvRmczD5vc6kTPQU1L4L
	 Jv9tFF0Zgi8Xt2S0CKQYq/CHkiCbwNroRRCEbUUzKldxL/LV2/R3zJ7+46e8TY41SH
	 l74ppbHawiA3udLXM9ZY3aphthjwKiwUsfbEV71Vxcr99txrEaQsgkbbsNSwmj4Iiq
	 4Qy0tA4NWr4UMM0eVf7t0dMzW+Hgt+YsLfPfSJH84aDzxIRLhAl1pL67WOr9UVyvb3
	 TD4qyEq8xGSn9tj5GvJCsltYIN1qHe4xDqjyoosllg4mvC2SVnHCHqRjJWaB8JUTtG
	 oSEB+fC3j77kg==
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Lee Jones <lee@kernel.org>, Navon John Lukose <navonjohnlukose@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20261025193613.278610-1-navonjohnlukose@gmail.com>
References: <20261025193613.278610-1-navonjohnlukose@gmail.com>
Subject: Re: (subset) [PATCH v3] mfd: intel-lpss: Set d3hot_delay to 0
Message-Id: <179379051799.1648707.14294292191445276936.b4-ty@b4>
Date: Wed, 04 Nov 2026 11:08:37 +0000
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
X-Mailer: b4 0.16-dev-ad80c

On Mon, 26 Oct 2026 01:06:13 +0530, Navon John Lukose wrote:
> Every runtime resume of an LPSS controller waits the default 10 ms
> d3hot_delay in pci_power_up() for the D3hot->D0 transition. Nothing
> misbehaves, but the wait adds latency. On Arrow Lake-H (Lenovo Yoga Pro 7
> 14IAH10) the touchpad's I2C controller autosuspends after 1 s idle, and
> the i2c-hid interrupt handler for the first report afterwards takes
> 12.6-14.4 ms.
> 
> [...]

Applied, thanks!

[1/1] mfd: intel-lpss: Set d3hot_delay to 0
      commit: 51510cef4708652a074fc6a4344299a14f07ec98

--
Lee Jones [李琼斯]

