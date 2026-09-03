Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98532AD35;
	Thu,  3 Sep 2026 00:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788395453; cv=none; b=DptBr+HHRxLbpod7sXSExjRNurbfEKiemwCEl1gTgt1PH5nn5o/EMTDbeO+fihqMv4UvaoupR+bUXaS08eZ1vKxLOBAb8VJmkaqhZtc4nbMOiAewNpn/1QEXFU0sNE76EeAGBpx7H0hhBN4EKkngrJ2Nei+O+IoPsXyVA/bb8bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788395453; c=relaxed/simple;
	bh=ua20xmgB1HptBEtU2b1WqsDmzDSvfIvJhA+CD0FX+O4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OLKVNV4Cxr5QT7rxA/JE4YbHp0I1xiLZDq7HZAlxfbarPpHpHjCnQeGTghz3HpiS6CaATga8eqLC1u9twgivnb+pbRQMPnBjc7E51rblwDvAfML9YKwhUlKt99lHzjA0pcopHZeW7XeGETcV4LNJGAcXx4aXvg8kxERum79bPNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=An+asTJn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="An+asTJn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D84EA1F000E9;
	Thu,  3 Sep 2026 00:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788395452;
	bh=zvsv78XcfA5J5/VKfW3UfuCMKETIux8Z9sYyMuskzMs=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=An+asTJnapn3HR2PQjo9RIXrT9SrC9IWvmFaOv8XZXL3W2gqtqo6fLntVX3+/aM/Z
	 7v/4kZFYD+nTa66VhYuwrxnZwGu8vyK4dQgngJ8GCtgNHicOoJvZg1bGoPKTSYmR3/
	 ehZwkj3SZFevkiIhHyfQtxhIGucVjxNllHeWkqTWQFpQsabFLaKj36pdt5edoPX54x
	 PYFUuRdppZ0LAFC04Ymo4I+Bf0jdcCFhpMNmg0fQZVomA/Z3PurHPXvO688vuIJnGC
	 uYDx1qNvirBqj05ZECFS5wgVl0ipmTUpmvzB+OX0uV92AMkjCv561ZJvk+iVw6atUV
	 hQ3CbqsMnSlyw==
Message-ID: <0525e219-c39d-47f2-aca3-d79c45b1f62f@kernel.org>
Date: Wed, 2 Sep 2026 19:30:50 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: dts: intel: fix dw-apb-timer clock
 initialisation on Agilex and Agilex5
Content-Language: en-US
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1779785788.git.adrian.ho.yin.ng@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <cover.1779785788.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/26/26 17:00, Adrian Ng Ho Yin wrote:
> The DesignWare APB timers on Intel Agilex and Agilex5 SoCs fail to
> initialise because their clock managers are platform drivers registered
> at core_initcall, which runs after time_init() where TIMER_OF_DECLARE
> callbacks fire.  With clocks/clock-names in the DTS, the timer driver
> calls clk_get() at a point when the clock provider is not yet
> registered, causing the timers to never come up.
> 
> Replace the clocks/clock-names reference in both DTSIs with a static
> clock-frequency of 100 MHz, which is the L4_SP clock rate configured
> by the bootloader.  The dw-apb-timer binding explicitly supports this
> as an alternative when the clock framework is unavailable at probe time.
> 
> Adrian Ng Ho Yin (2):
>    arm64: dts: socfpga: agilex5: replace clocks reference with
>      clock-frequency for dw-apb-timer
>    arm64: dts: socfpga: agilex: replace clocks reference with
>      clock-frequency for dw-apb-timer
> 
>   arch/arm64/boot/dts/intel/socfpga_agilex.dtsi  | 12 ++++--------
>   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 12 ++++--------
>   2 files changed, 8 insertions(+), 16 deletions(-)
> 

Do you want this to get backported to stable releeases? If so, please 
append a Fixes tag.

I think the same patch can be applied to socfpga_stratix10.dtsi.

Thanks,
Dinh

