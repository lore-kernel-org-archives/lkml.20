Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13931288C81;
	Thu, 17 Sep 2026 22:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789684255; cv=none; b=a378T4GZJxz/quIZARPq89zoilcW1CVomrXYH5bghu3SbAfYgf24F4FjpGuUZzSUL7g3xusfwF4oXYE8Bq7EtZkslEc8Khah+prLXLnrUz+7WiWTxOnQkerMXo7C+LXqG9pmam4dyDsRDpD0DX5mTb3uuD3GJcDS+1ugsaSkJeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789684255; c=relaxed/simple;
	bh=yMVntEvByiQnwXoY/WDeu9YYuOKVHTMYd+Zy59/3QDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ujQs6iHQxCyvwGHLqJ80gVYVb1XmkV1H0QX5YtfRfm9xLMkIqHjbkgBcIIprcH7zU+4RCJ6ZgmVYXErBQEithLgS3n3ZeqKgyc4qqAI2qaDS8EYpuFKs89rTAmdv5Qb/TckCMk0vywBKvPAlaYSRAxb0xyz3DF+T6ZLiej3zkf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OLPLzJkL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OLPLzJkL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FC811F000FF;
	Thu, 17 Sep 2026 22:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789684253;
	bh=4/qx3gACLobp/kVaCWxWU6urjoLYTDk1lm6knmcF17E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OLPLzJkL2pS51ZSdjvIK3zdS7esWlyTgsGn50j02Y2ZED9OxLGUZj7V58u32BmEVK
	 mX85kSqvR/CetXKufKiQsPtO5BR1RnM3JufEsmwuZFSQ2JISfXRFnHaqZhMILoYcBT
	 Bvd5PDr8DhkgvFvdihoRBfnNnxj3vscpeS3yKXdIXLuxYh1VEMXTEJM5MD30ZrehVZ
	 zNULAC0juzOT3fAL3u3cbRGdHpCTaOdwUye3he5MwrRa1ZyY14KJZtNhvcXcwHjjq/
	 ek+uXsramaiYLMPIhp70TYdNX/cb5Vfj9+a5zJU2Se9X5x4PhfMRaRd/IKAA6FCgyQ
	 rtAnBRZI1P99w==
Date: Thu, 17 Sep 2026 17:30:51 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sven Peter <sven@kernel.org>
Cc: Janne Grunau <j@jannau.net>, Philipp Zabel <p.zabel@pengutronix.de>,
	Neal Gompa <neal@gompa.dev>, Konrad Dybcio <konradybcio@kernel.org>,
	devicetree@vger.kernel.org, Joshua Peisach <jpeisach@ubuntu.com>,
	asahi@lists.linux.dev, Conor Dooley <conor+dt@kernel.org>,
	Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v2 05/22] dt-bindings: thunderbolt: Add Apple
 USB4/Thunderbolt NHI
Message-ID: <178968425120.4102150.11013505530489451162.robh@kernel.org>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-5-1f80085f93fb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-5-1f80085f93fb@kernel.org>


On Sun, 06 Sep 2026 20:36:28 +0200, Sven Peter wrote:
> The Native Host Interface (NHI) provides the TX and RX rings used by the
> software connection manager on Apple Silicon SoCs.
> 
> The NHI is part of the ACIO host router and is exposed to the main SoC
> bus while the ACIO co-processor is running.
> 
> T6000 and T6020 use one DART stream for the TX and RX control rings and
> one shared by all other rings, which are used for XDomain connections.
> This likely improves the isolation of those host-to-host connections.
> 
> The M3 generation uses a slightly insane set of 24 IOMMU entries. These
> are probably one DART stream for each TX and RX ring.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
> ---
>  .../bindings/thunderbolt/apple,t8103-usb4-nhi.yaml | 151 +++++++++++++++++++++
>  MAINTAINERS                                        |   2 +
>  2 files changed, 153 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

