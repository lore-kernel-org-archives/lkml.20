Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792518131;
	b=LrXGTGCAjbxH1OGZA3Pc5HmFW90LaJz5x6RnFxlsl9hch4h/uNMONs7NNbyVYHZZ4AOv
	 2bQRJKGKY2lBkC3vlrjGD2X1g78zmQA0aZGzn/DDal11dw0BSRxuRvWv0zh2lczrBxH9K
	 9hpyN2f71pw5lMb+vn5Lt7H8B0o93n7DyfF7ghsfNiyVn4uXA71xUpgk61qV0AvdVvWOB
	 /KlPZ8r3Wh1Cb8zJpSJUxG7Fb6A2qZNLxUK/BrMp5AdPUKOkHmiLeg35YQFqjWqPOMRsy
	 cYWr4nzm/x8m27lx6GEHLFjjItI0UrSJ3tBFlZl1bA3vuXoxeWhs+hN5saC882Wef7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792518131;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=KcuisqKcfY3dDkZrKVJFMzd0fcQSPtB9DKKrNu6xMDc=;
	b=f1Bxv32iuJW4/eAHQrj9fwMN8X5/SQulR9qltPnNbAJpYVjsMT4O8VjGIMd2GcgAZ64r
	 4O9wxN/tp4HSf84cqGsGCC56phPLPuqOFSRwqEB9TCUr9ANbqQHqAQyLs9uoZnhT0HWc7
	 Bhe6boXHGEv9O/+0BDtezeUwdTjm80bKKzAEJ4fl32z2u6P/Bs+MewoT5xZKJm2D1mgvQ
	 bC1BUgLlAA08pN56IMXPHrgJYYF0VcuMLBcS0uQMhplEngWvZi/gl+RfyBxHMK7l6JsdK
	 1irj8hNeph4N27luW+vYpU7S9v7Fdwp8AAcTCsh6ytv7z3098Bo08vjLjNNrqSgSV0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lptfetT5;
	arc=none smtp.remote-ip=91.218.175.92
Received: from mta0.migadu.com (out-92.mta0.migadu.com [91.218.175.92])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB780606A320
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB780606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lptfetT5
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=HYlZAjvPSvUg0EYki+B31cFwdxYGZdn+4RyzYF3vYvA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792518128; v=1; x=1793122928;
 b=lptfetT5dOp/2iAjEqVDD7cYtmxdUNBZ+peHMyAKCJ7yL0nkjG/A3G/EWtl7QWmSv+d6sUaN
 OXSRpeYp1wxjeSok+Zu8xSgZ6WdIU9LPs8soKqG/wFT8o9zuthY6jAQaYy0VyfRTGEZXJzHibTD
 DXDkn/21wF1WWmEkjWy3LXc4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7f73adbe8e2cc93d;
	Tue, 20 Oct 2026 17:42:08 +0000
X-Mizu-Trace-ID: 7f73adbe8e2cc93d
X-Migadu-Flow: FLOW_OUT
Message-ID: <2d180813-48c1-4a39-bbfa-83b813dea60a@linux.dev>
Date: Tue, 20 Oct 2026 19:42:06 +0200
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
Subject: Re: [PATCH v4 7/7] HID: asus: Keep the Zenbook Duo input device names
To: Paolo Pisati <p.pisati@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Rebecca_Mara_M=C3=BCller?= <rebecca.mara@posteo.de>,
 Luke Jones <luke@ljones.dev>,
 Joshua Leivenzon <hacker1024@users.sourceforge.net>,
 Ivan Levchenko <me@livan.pro>, Nathan Chancellor <nathan@kernel.org>
References: <20261020092423.36380-1-p.pisati@gmail.com>
 <20261020092423.36380-8-p.pisati@gmail.com>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20261020092423.36380-8-p.pisati@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10/20/26 11:24, Paolo Pisati wrote:
> hid-asus renames the input devices of the keyboards it handles to
> "Asus Keyboard", except for the ROG N-Key ones, which keep the names
> the devices report. New devices are not renamed any more, so skip the
> rename for the Zenbook Duo keyboards too: their input devices keep the
> "ASUS Zenbook Duo Keyboard" names they get without this driver.

Reviewed-by: Denis Benato <denis.benato@linux.dev>

> Suggested-by: Denis Benato <denis.benato@linux.dev>
> Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
> ---
>  drivers/hid/hid-asus.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 6ee2ecca864d..69894de8f6ce 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -1712,10 +1712,10 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  		hid_warn(hdev, "Failed to initialize backlight.\n");
>  
>  	/*
> -	 * For ROG keyboards, skip rename for consistency and ->input check as
> -	 * some devices do not have inputs.
> +	 * For ROG and Zenbook Duo keyboards, skip rename for consistency and
> +	 * ->input check as some devices do not have inputs.
>  	 */
> -	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD)
> +	if (drvdata->quirks & (QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ZENBOOK_DUO_KEYBOARD))
>  		return 0;
>  
>  	/*
