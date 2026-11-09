Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794202654;
	b=zmxhSR86/nVacBDmIJGUwvyKBIMlrKgAZKwMgxUoN64LEONDsfwqNHzjoWT4VAnR4vzX
	 G/YzKfVV6J5tW6rgEYvZ7zO+B6tqvgJUiIQ8zEHByf7AKLR2CqzsJRMcSPz6xq7NiR6Pm
	 i8J8IzMa6o36Gwfafj+RfsvKm6ZCHtXx7bWeXkzks+I/gChjLLa/EZhsEbSw9OYWebmvq
	 nzIWXV0R9oK7NCBeWA/gsn2FVMVRE/ukHo0a1/BDU9KdFSwaDy8wowWcroEVHWQQXIVW3
	 BwzupCRvmMaqCVl6jPwML2/HzNUK7VcCRi1UWL3YTRuYfXno9lu8fn6T4YwyiNP2hcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794202654;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=OZSprJd58koVHnNVu9krII899i4nE1NEmmENuqj9Pqs=;
	b=fs0bIWUE7d2hrc0qTnSOqbztEjcr9OAOrdktqq3kKNUFT8kuzrlD7IDrjqTqY7qtlBph
	 j91S+5LZ7R/AXceoZ6+lFaGi/j2xFKK3dtpxtdQ9Zpdj7UbgRIqIhNQhj2K5i4Z9Flege
	 /1jc5Z5mNGZWzpVwmYTAw4ycIbZhDXe2xw2wFq+9PwLqxW6BIA6hjv+OGiDfmo9M+hIZ5
	 stOSV/C1bDqtlriWeahxcL8HNukWYzbdXyXuBg4NmqMtu5eG3J6oV28KKSqMv6KLtpzbx
	 QNfwk04vu3If0yi62J5V0Me5vXe7RdKQGU1jk7QIB3M0yDEk6dKsPGkaeSSlCuqYwMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=P6RiCvQZ;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420D1606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 420D1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=P6RiCvQZ
Received: from eig-obgw-5005b.ext.cloudfilter.net ([10.0.29.189])
	by cmsmtp with ESMTPS
	id QGfNxUnzIJFmFQI4Sxzzz9; Mon, 09 Nov 2026 05:37:32 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id QI4RxJb2pYskhQI4SxK9xd; Mon, 09 Nov 2026 05:37:32 +0000
X-Authority-Analysis: v=2.4 cv=CKMqXQrD c=1 sm=1 tr=0 ts=6af15c1c
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=xmH7ukj5eckyXlbb7W0A:9 a=QEXdDO2ut3YA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=OZSprJd58koVHnNVu9krII899i4nE1NEmmENuqj9Pqs=; b=P6RiCvQZJSGf
	IiRGOqjd9x2TftyHwXqV/sUZKDmxeBuvCIckAPdCQs7M5KGFlez/5UU/iExaou85fa7inSgNeStN0
	Y9AyKIGeHhaD53nh5kBRPSAteaxAAc+ZOY5GwPu5lXma7Zm0iQo9X9s8nNoxws64I9VivQX2zoz8r
	/NUuLwB95hnKoKtcENMj0s0hca9sQb9MLuodgJ+J0YzYN2znga0E+UmOgTqhpReip7RrXJzg8Lrj1
	EguV9vvObjsT873YV7l8BTo6bK9xAvXiC40LQSNpFgcicZsWRpNnvuqIdrKYRU5lLmW/KS6bEOx/f
	hRNCtrw4KtddQSPmEoGobw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:57702)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQI4R-00000004LeM-1h7G;
	Mon, 09 Nov 2026 11:07:31 +0530
Message-ID: <487b2f39-7e22-46db-9eaf-9b1dd9b31d31@roeck-us.net>
Date: Sun, 8 Nov 2026 21:37:30 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (nct6683) Report the fan curves of MSI boards with
 NCT6687D-R
To: Tomasz Bojanowski <tomasz@bojanowski.me>
Cc: linux-hwmon@vger.kernel.org, Hamza Mahfooz <someguy@effective-light.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261109015759.24284-1-tomasz@bojanowski.me>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261109015759.24284-1-tomasz@bojanowski.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQI4R-00000004LeM-1h7G
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:57702
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 1
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFfMj56xlf1pTZ+9LkmYg8FTGHwYnpzor7hFUlgOvNiOkf6NDLkkIohtX2cIW31XE6/2hmhyvoQe2tV+6duEe/sRRyU+xXa7nmhDZneFrfVps+VfzlLP
 95XsquEAidjuhy1qxUz63XCDS5FhD8bL22bqEXqxeBEaeGG0ok1I2ltwxQqSSHXH1WFaa/qNiTVOlPLsQoTzOCewS6arfuQ4yo4o4rDxY0Fnk1JyARzkTvFj

On 11/8/26 17:57, Tomasz Bojanowski wrote:
> In automatic mode, the fans of MSI boards with an NCT6687D-R (customer
> ID 0x20d) follow the fan curve configured in the BIOS setup. Report
> these curves with the standard pwmN_auto_point[1-7]_temp,
> pwmN_auto_point[1-7]_pwm and pwmN_auto_channels_temp attributes,
> so that users can see what automatic mode does.
> 
> The register layout comes from reverse engineering of the vendor's
> Windows software and was confirmed by reading the EC of an MSI MAG
> B850M MORTAR WIFI (MS-7E61, BIOS 1.A68, EC firmware build 03/10/25):
> for all six controlled fans, the curves match the settings in the BIOS
> setup, also after changing them and after a power cycle. Other boards
> with customer ID 0x20d have not been checked.
> 
> The curve of fan channel n is stored at 0xb00 + 0x18 * n: seven
> temperatures in degrees Celsius, followed by seven outputs of two bytes
> each. On the test board, the high byte of each output is zero and the
> low byte holds the duty cycle (0-255). Register 0xa08 + n (channels
> 0-7) or 0x240 + n - 10 (channels 10-15) is 0x40 on the test board for
> all channels with a fan header. The temperature source of the curve
> appears to be a bitmap of monitoring channels at 0x910 + 4 * n. The
> driver assumes that bit k of this 32-bit big-endian value selects
> monitoring channel k; on the test board, all curves use bit 0, which is
> temp1.
> 
> The attributes are created for the channels which support fan control,
> if the mode register of their curve is 0x40 and the high byte of each
> output is zero when the driver is probed. They are read-only and read
> from the EC on each access. If a curve uses a temperature source which
> the driver does not report, reading pwmN_auto_channels_temp returns
> -ENODATA. The new code only reads EC registers.
> 
> Tested on the same board with kernel 7.2.15 and the driver built as an
> out-of-tree module: all attributes show the values read from the EC
> with a separate read-only tool, and pwm4, which does not support fan
> control, gets no fan curve attributes.
> 
> Signed-off-by: Tomasz Bojanowski <tomasz@bojanowski.me>
> ---
> I used an AI assistant (Claude Code) during development. I reviewed all
> of the changes, tested them on the hardware described above, and take
> responsibility for them.
> 
> This applies on top of hwmon-next, which has the fan control support for
> these boards.
> 
> Support for writing the curves would follow in a separate series. Two
> questions before I start on it:
> 
> 1. pwmN_enable = 2 currently means that the EC follows the curve set in
>     the BIOS setup. Once the curves can be written, should 2 keep this

No, 2 means automatic mode. From the documentation:

   * 2: automatic mode, using the fan curve configured in the BIOS

That the mode is (currently) set by the BIOS is secondary information,
clarifying the origin of the fan curve.

>     meaning and restore that curve, with a new value 3 for a curve set
>     through the driver? Or should 2 simply mean "the current curve"?
> 

Again, 2 means automatic mode. "current" is implied. I do not see the
point of introducing more complexity. No other driver does that,
and it should not be done in this driver either.

> 2. Should the driver restore the original curves when it is unloaded,
>     for the fans whose curves it changed?
> 
Your call. A more important problem is going to be handling after
suspend/resume. The BIOS will restore its default settings during
resume, which might be unexpected unless the configuration is restored
in the driver.

Thanks,
Guenter

>   Documentation/hwmon/nct6683.rst |  15 +++
>   drivers/hwmon/nct6683.c         | 168 +++++++++++++++++++++++++++++++-
>   2 files changed, 181 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/hwmon/nct6683.rst b/Documentation/hwmon/nct6683.rst
> index ffc80fad3865..62da8fd011c8 100644
> --- a/Documentation/hwmon/nct6683.rst
> +++ b/Documentation/hwmon/nct6683.rst
> @@ -65,6 +65,21 @@ pwmN_enable selects the fan control mode:
>   pwmN can only be written in manual mode. Switching to manual mode keeps the
>   current duty cycle.
>   
> +For each fan with a pwmN_enable attribute, the fan curve configured in the
> +BIOS setup is reported with the following read-only attributes, if the
> +curve sets a duty cycle:
> +
> +  * pwmN_auto_point[1-7]_temp: temperature of the curve point, in
> +    millidegrees Celsius
> +  * pwmN_auto_point[1-7]_pwm: duty cycle of the curve point (0-255)
> +  * pwmN_auto_channels_temp: temperature channels used by the curve, as a
> +    bitmap (1 is temp1, 2 is temp2, 4 is temp3 etc.)
> +
> +A fan with Smart Fan disabled in the BIOS setup has a flat curve, with its
> +fixed duty cycle at all points. The curve is read from the EC on each
> +access. Reading pwmN_auto_channels_temp returns -ENODATA if the curve uses
> +a temperature source which the driver does not report.
> +
>   Tested Boards and Firmware Versions
>   -----------------------------------
>   
> diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
> index 65e374c64fb8..f94f47e31933 100644
> --- a/drivers/hwmon/nct6683.c
> +++ b/drivers/hwmon/nct6683.c
> @@ -178,6 +178,16 @@ superio_exit(int ioreg)
>   
>   #define NCT6687DR_FAN_CTRL_MASK		(BIT(0) | BIT(1) | GENMASK(15, 10))
>   
> +/* Fan curves of NCT6687D-R, with a temperature and an output per point */
> +#define NCT6687DR_CURVE_POINTS		7
> +#define NCT6687DR_REG_CURVE_TEMP(x, p)	(0xb00 + (x) * 0x18 + (p))
> +#define NCT6687DR_REG_CURVE_OUT_HI(x, p) (0xb07 + (x) * 0x18 + (p) * 2)
> +#define NCT6687DR_REG_CURVE_OUT_LO(x, p) (0xb08 + (x) * 0x18 + (p) * 2)
> +#define NCT6687DR_REG_CURVE_SRC(x)	(0x910 + (x) * 4)	/* 32 bit */
> +#define NCT6687DR_REG_CURVE_MODE(x)	(0xa08 + (x))		/* channels 0-7 */
> +#define NCT6687DR_REG_CURVE_MODE_SYS(x)	(0x240 + (x) - 10)	/* channels 10-15 */
> +#define NCT6687DR_CURVE_MODE_PWM	0x40
> +
>   #define NCT6687DR_REG_FAN_ENGINE_STS	0xcf8
>   #define NCT6687DR_FAN_ENGINE_PHASE	BIT(3)
>   #define NCT6687DR_FAN_ENGINE_INVALID	BIT(4)
> @@ -360,6 +370,7 @@ struct nct6683_data {
>   	u8 pwm[NCT6683_NUM_REG_FAN];	/* indexed by fan channel */
>   
>   	u16 have_fan_ctrl;		/* channels supporting fan control */
> +	u16 have_curve;			/* channels with a duty cycle curve */
>   
>   #ifdef CONFIG_PM
>   	/* Remember extra register values over suspend/resume */
> @@ -1143,17 +1154,117 @@ store_pwm_enable(struct device *dev, struct device_attribute *attr,
>   SENSOR_TEMPLATE(pwm_enable, "pwm%d_enable", 0444, show_pwm_enable,
>   		store_pwm_enable, 0);
>   
> +/* Fan curves, read from the EC on each access */
> +static ssize_t
> +show_pwm_auto_point_temp(struct device *dev, struct device_attribute *attr,
> +			 char *buf)
> +{
> +	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
> +	struct nct6683_data *data = dev_get_drvdata(dev);
> +	u16 reg = NCT6687DR_REG_CURVE_TEMP(sattr->nr, sattr->index);
> +	int val;
> +
> +	mutex_lock(&data->update_lock);
> +	val = nct6683_read(data, reg);
> +	mutex_unlock(&data->update_lock);
> +
> +	return sysfs_emit(buf, "%d\n", val * 1000);
> +}
> +
> +static ssize_t
> +show_pwm_auto_point_pwm(struct device *dev, struct device_attribute *attr,
> +			char *buf)
> +{
> +	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
> +	struct nct6683_data *data = dev_get_drvdata(dev);
> +	u16 reg = NCT6687DR_REG_CURVE_OUT_LO(sattr->nr, sattr->index);
> +	int val;
> +
> +	mutex_lock(&data->update_lock);
> +	val = nct6683_read(data, reg);
> +	mutex_unlock(&data->update_lock);
> +
> +	return sysfs_emit(buf, "%d\n", val);
> +}
> +
> +static ssize_t
> +show_pwm_auto_channels_temp(struct device *dev, struct device_attribute *attr,
> +			    char *buf)
> +{
> +	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
> +	struct nct6683_data *data = dev_get_drvdata(dev);
> +	u16 reg = NCT6687DR_REG_CURVE_SRC(sattr->index);
> +	u32 src, channels = 0;
> +	int i;
> +
> +	mutex_lock(&data->update_lock);
> +	src = (u32)nct6683_read16(data, reg) << 16 |
> +	      nct6683_read16(data, reg + 2);
> +	mutex_unlock(&data->update_lock);
> +
> +	/* Bit n of the source register selects monitoring channel n */
> +	for (i = 0; i < data->temp_num; i++) {
> +		if (src & BIT(data->temp_index[i])) {
> +			channels |= BIT(i);
> +			src &= ~BIT(data->temp_index[i]);
> +		}
> +	}
> +
> +	/* Temperature sources which are not reported cannot be mapped */
> +	if (src)
> +		return -ENODATA;
> +
> +	return sysfs_emit(buf, "%u\n", channels);
> +}
> +
> +SENSOR_TEMPLATE(pwm_auto_channels_temp, "pwm%d_auto_channels_temp", 0444,
> +		show_pwm_auto_channels_temp, NULL, 0);
> +SENSOR_TEMPLATE_2(pwm_auto_point1_temp, "pwm%d_auto_point1_temp", 0444,
> +		  show_pwm_auto_point_temp, NULL, 0, 0);
> +SENSOR_TEMPLATE_2(pwm_auto_point1_pwm, "pwm%d_auto_point1_pwm", 0444,
> +		  show_pwm_auto_point_pwm, NULL, 0, 0);
> +SENSOR_TEMPLATE_2(pwm_auto_point2_temp, "pwm%d_auto_point2_temp", 0444,
> +		  show_pwm_auto_point_temp, NULL, 0, 1);
> +SENSOR_TEMPLATE_2(pwm_auto_point2_pwm, "pwm%d_auto_point2_pwm", 0444,
> +		  show_pwm_auto_point_pwm, NULL, 0, 1);
> +SENSOR_TEMPLATE_2(pwm_auto_point3_temp, "pwm%d_auto_point3_temp", 0444,
> +		  show_pwm_auto_point_temp, NULL, 0, 2);
> +SENSOR_TEMPLATE_2(pwm_auto_point3_pwm, "pwm%d_auto_point3_pwm", 0444,
> +		  show_pwm_auto_point_pwm, NULL, 0, 2);
> +SENSOR_TEMPLATE_2(pwm_auto_point4_temp, "pwm%d_auto_point4_temp", 0444,
> +		  show_pwm_auto_point_temp, NULL, 0, 3);
> +SENSOR_TEMPLATE_2(pwm_auto_point4_pwm, "pwm%d_auto_point4_pwm", 0444,
> +		  show_pwm_auto_point_pwm, NULL, 0, 3);
> +SENSOR_TEMPLATE_2(pwm_auto_point5_temp, "pwm%d_auto_point5_temp", 0444,
> +		  show_pwm_auto_point_temp, NULL, 0, 4);
> +SENSOR_TEMPLATE_2(pwm_auto_point5_pwm, "pwm%d_auto_point5_pwm", 0444,
> +		  show_pwm_auto_point_pwm, NULL, 0, 4);
> +SENSOR_TEMPLATE_2(pwm_auto_point6_temp, "pwm%d_auto_point6_temp", 0444,
> +		  show_pwm_auto_point_temp, NULL, 0, 5);
> +SENSOR_TEMPLATE_2(pwm_auto_point6_pwm, "pwm%d_auto_point6_pwm", 0444,
> +		  show_pwm_auto_point_pwm, NULL, 0, 5);
> +SENSOR_TEMPLATE_2(pwm_auto_point7_temp, "pwm%d_auto_point7_temp", 0444,
> +		  show_pwm_auto_point_temp, NULL, 0, 6);
> +SENSOR_TEMPLATE_2(pwm_auto_point7_pwm, "pwm%d_auto_point7_pwm", 0444,
> +		  show_pwm_auto_point_pwm, NULL, 0, 6);
> +
> +/* pwm, pwm_enable, pwm_auto_channels_temp and the fan curve points */
> +#define NCT6683_PWM_TEMPLATES	(3 + 2 * NCT6687DR_CURVE_POINTS)
> +
>   static umode_t nct6683_pwm_is_visible(struct kobject *kobj,
>   				      struct attribute *attr, int index)
>   {
>   	struct device *dev = kobj_to_dev(kobj);
>   	struct nct6683_data *data = dev_get_drvdata(dev);
> -	int pwm = index / 2;	/* pwm index */
> -	int nr = index % 2;	/* attribute index */
> +	int pwm = index / NCT6683_PWM_TEMPLATES;	/* pwm index */
> +	int nr = index % NCT6683_PWM_TEMPLATES;		/* attribute index */
>   
>   	if (!(data->have_pwm & (1 << pwm)))
>   		return 0;
>   
> +	if (nr >= 2)	/* fan curve */
> +		return (data->have_curve & BIT(pwm)) ? attr->mode : 0;
> +
>   	if (data->have_fan_ctrl & BIT(pwm))
>   		return attr->mode | 0200;
>   
> @@ -1166,9 +1277,29 @@ static umode_t nct6683_pwm_is_visible(struct kobject *kobj,
>   	return attr->mode;
>   }
>   
> +/*
> + * nct6683_pwm_is_visible uses the index into the following array
> + * to determine if attributes should be created or not.
> + * Any change in order or content must be matched.
> + */
>   static struct sensor_device_template *nct6683_attributes_pwm_template[] = {
>   	&sensor_dev_template_pwm,
>   	&sensor_dev_template_pwm_enable,
> +	&sensor_dev_template_pwm_auto_channels_temp,	/* 2 */
> +	&sensor_dev_template_pwm_auto_point1_temp,
> +	&sensor_dev_template_pwm_auto_point1_pwm,
> +	&sensor_dev_template_pwm_auto_point2_temp,
> +	&sensor_dev_template_pwm_auto_point2_pwm,
> +	&sensor_dev_template_pwm_auto_point3_temp,
> +	&sensor_dev_template_pwm_auto_point3_pwm,
> +	&sensor_dev_template_pwm_auto_point4_temp,
> +	&sensor_dev_template_pwm_auto_point4_pwm,
> +	&sensor_dev_template_pwm_auto_point5_temp,
> +	&sensor_dev_template_pwm_auto_point5_pwm,
> +	&sensor_dev_template_pwm_auto_point6_temp,
> +	&sensor_dev_template_pwm_auto_point6_pwm,
> +	&sensor_dev_template_pwm_auto_point7_temp,
> +	&sensor_dev_template_pwm_auto_point7_pwm,
>   	NULL
>   };
>   
> @@ -1327,6 +1458,32 @@ static inline void nct6683_init_device(struct nct6683_data *data)
>   		nct6683_write(data, NCT6683_HWM_CFG, tmp | 0x80);
>   }
>   
> +static u16 nct6687dr_curve_mode_reg(int ch)
> +{
> +	return ch < 8 ? NCT6687DR_REG_CURVE_MODE(ch) :
> +			NCT6687DR_REG_CURVE_MODE_SYS(ch);
> +}
> +
> +/*
> + * A fan curve sets a duty cycle if its mode register is 0x40 and the high
> + * byte of each output is zero. The low byte then holds the duty cycle.
> + */
> +static bool nct6687dr_curve_is_pwm(struct nct6683_data *data, int ch)
> +{
> +	int p;
> +
> +	if (nct6683_read(data, nct6687dr_curve_mode_reg(ch)) !=
> +	    NCT6687DR_CURVE_MODE_PWM)
> +		return false;
> +
> +	for (p = 0; p < NCT6687DR_CURVE_POINTS; p++) {
> +		if (nct6683_read(data, NCT6687DR_REG_CURVE_OUT_HI(ch, p)))
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
>   /*
>    * There are a total of 24 fan inputs. Each can be configured as input
>    * or as output. A maximum of 16 inputs and 8 outputs is configurable.
> @@ -1359,6 +1516,13 @@ nct6683_setup_fans(struct nct6683_data *data)
>   		data->have_fan_ctrl = NCT6687DR_FAN_CTRL_MASK &
>   			(data->have_pwm | (data->have_fan & GENMASK(15, 8)));
>   		data->have_pwm |= data->have_fan_ctrl;
> +
> +		/* Only report fan curves which set a duty cycle */
> +		for (i = 0; i < NCT6683_NUM_REG_FAN; i++) {
> +			if ((data->have_fan_ctrl & BIT(i)) &&
> +			    nct6687dr_curve_is_pwm(data, i))
> +				data->have_curve |= BIT(i);
> +		}
>   	}
>   }
>   
> 
> base-commit: ec921ef8d81acf0cc41b3f3b6db54698e9a2917f

