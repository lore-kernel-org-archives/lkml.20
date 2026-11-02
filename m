Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793629104;
	b=UldTCePYGFFnVRPv1pEnH2Tg51n6iBtn4xD5OHer8LKrVP+j4r79pGCC6rWzr50eWRhV
	 c5O6F3NgqRkEaL0qtfK7f8SdfDdX5DmuzPq5xRUuH8DbIiW9cgyObPXLp0F7Yz8ulLzRj
	 GYqWlGXRxI2Xtk7AbNn1bBUoCF6nMlnp4vO6pfbNEf5GHqDkzagFfVmq1+15vioSX/xan
	 pNv70qaY6ooMzq3OFke2MSwJv2iktlLtFMuKmOysOCuMtri0cq4T4ogGRrVaiEth2FQS8
	 fPJm39z/QbBV+aoueH7yMggjLFFGaWezXBjUhH0k3gyc99gfJ0diP/U7ZapQJg3BSvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1RjcRhzwmQTEwl1HX0Rcpr8H7X1jrpm5LzpMX36K/ho=;
	b=Gpu321sbIT768LAv8ff1V6nvwvm6jqvsFo+D5jy5KWUZTTGScJi4XJjPthXkUU0IRG1T
	 c3xQWcnmx1w7y1CBPVxUBtO89QVsS2Z3GX5lXcbj33iEDOMYx8SDdQUlYqNVuy5k/Uav9
	 1JpLvTQmhRuNJkNgQv/9OfWEQWQ7S+ayKN/er2uhK4d/WHeVwJyyB3S0X2xqQL45gSSjT
	 Kb7wM1s0nzr89FutJGRwlB4T/4KYW82g5xlR1+vStR5xRPVdVXBI40GV7EJITH6Tqqnwu
	 W02GaF8fL0IpRqH7i0q9R+7rlT++a0VnJwS9f2+ZyEONQbHacATwISdsbn4uKOYAYwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PbeeezhM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7802A606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7802A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PbeeezhM
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5365b48238dso29450801cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:18:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793629103; cv=none;
        d=google.com; s=arc-20260327;
        b=r7udwylXAI3brCptUInJnNPnPlURFWa+CuaeetA47FQyc9+hz/wb6JO76iY/XXnvsM
         bgN89Lqz7PAuG2wGKwiznTXV+kq69Ets1OG76aaQVWPHwATNX7ymyXWBkNEzfdqRnoZr
         EYMPEfaQowLjVc+EK9RWAvm1Rv2fqJwFju60/o0cIlvNYaa/DaUOcBZ6Lzwzq6hMdbPD
         T23WPQ8DafhL+4X91pVmoQpKvvvO28VxYat0jN19rErSEc1IPvNQK2peK3AFulESIldu
         48Qh3S7357XPPYyYJQgjbGwK/J9n0ubVLxGlPCDvR3zsX986johjrh6rYRJrQOGkC1c2
         Vp0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1RjcRhzwmQTEwl1HX0Rcpr8H7X1jrpm5LzpMX36K/ho=;
        fh=OxH6F8VjUfVlFk83b+fUMQHktR9UJbEltkg5rjuvWUU=;
        b=XReU+fNgbLrCLKXG4X0f/xFWPp3nlSqtfS9LKEVLVQThvyRomS4lpw0D+xj+4/xKOS
         xxNDGKmbHsA45IGibP/96YApdtY9WX5K/1L/K63CWvMZTrqX5SA8jKN13cwEHkfmnmkP
         Kb+0uL9ZtAvdvbuWfIELjG0gFP7IjyqotCIXE3E1aaiyvC/Zh+aCSMU4a4XIWJhn67vq
         vyupW3+eVUuW4G28S8+R2R+me4slIRKniCFSFwfavqOJftWfehJxweO+x14xEhMvQN/L
         gLQQUR7UO5al+khinFqTFXV+YEqLYypi4WjOAl2Jl7aQw/Eh9TBDjg8+iiHZUoIi4ZCX
         ni6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793629103; x=1794233903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1RjcRhzwmQTEwl1HX0Rcpr8H7X1jrpm5LzpMX36K/ho=;
        b=PbeeezhMulKAYODMPXyEf9EXpC94WBFBtZuxUCIE3iKjPGxewNJ4DWGO2qC+f/2Xms
         CbvFCTJ/islxrhWhv0twgd5H1A0KfUBdt1B88MwYpFeJE+bGn0eFS0lyt7q+zr8gBVpj
         qedDGkvSEZ6f4CbvLrV9y2XOuJ64LRobUGymlpd66T231UfarBM6cuDARr888XimqBxL
         xj9nJdejSQhQUjRNoZQf2CU5zAy9/wGUgbDXNt87wwymXLs5OTvy7CuvKG3SLPiT4rKb
         GOQC5pcixm3N8XJXB8IBMTOkxr+1ADfPB6R29+oBEPQ0JaU+wGCDCh1PVv+ea08BJSR3
         SnqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629103; x=1794233903;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1RjcRhzwmQTEwl1HX0Rcpr8H7X1jrpm5LzpMX36K/ho=;
        b=zNsLDnpjBV0tn96ysuJXRGtRtKMNXB37ms+CXrwnChE4m6D2UjY7IkYZfG2lLnHCFM
         Xqw21jXq75/Pc64nN08++BH+hBZbq35s2BXqozOMfrI5WJk9NhubD+KMFkW1KQE0F/I3
         FQkC9c/000NUYTYe+YPp/NPckf2A0VRPlwOcx6Nunfna5OdQ9D/QccOsDHcQYr4IC3Uc
         jJbKX/JSqf67j0AQMA0p25eU97JlfmXJemVqaY6V9fi5alYNdbQ1g53A36HNz7OhoJgx
         mgKBvOuSiHNinuIAxcPp3/kummCGT5FZf5en59Pbk2nBPei3U6q1G+rlK7uEQ6EZr/K1
         6hCg==
X-Forwarded-Encrypted: i=1; AKwUvBwHKRv10or19ZnTVVYp7fXMdpTnRBunJ3zsIlBMN4nXIlZsLHk9H77BLf2YpRhE6EiSpPpWWmkUHVbkpyo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ulw841buHe93jkKMdTP0GyIQmLgEBKKz/0dNQ3GZB95ucxBgt
	w00WGoX8NAxRLDBlXPNM8auwWLVSq9f4YFTvQg3QyodYIuSzSHA5c/EQfh0Hcm7rHkxHnoybHNL
	HkhmkjnDFHcalbW4w+uT767sOcIjQhnw=
X-Gm-Gg: AYBFou22Z8Wvow9k1KZpBoJFXHzfJr9is62aMzOr4uR7vHpbLIYKZgb0+9IYnZywtE2
	X8eiNjE7XgJubeDHmsqxXuAWx/jdlFszkTyPfTOLTw7YPk7fEZavkn/x+rLXcRvVizEpCStQ68w
	ofwhRdi7ET6YYsmfHFlcLgUY8T4C7+kyv8t6/N5Sx9DRvmQ5iBGuUdooc7ggzal/BQWNWIQLXXM
	z9tvBV/EfkQvKMpEsLQqZS0XZrYzet+T7cEyw3fhRroANV7MGYQ++RnOMXbPjLVQzOKYaJMhyaf
	JEYX071MpNLIS0rqqEPf7Rbd9LhXBAE03rSrR8s0V+9svtbIE3S4Pb712YwIZ+4cv+2NcTf7bDt
	k4PiAv7/LVDEYxuHcMF2x5YKRiQM/Ucw5wWdzig==
X-Received: by 2002:ac8:5708:0:b0:536:6378:c80d with SMTP id
 d75a77b69052e-542b6f50532mr162652461cf.32.1793629100726; Mon, 02 Nov 2026
 06:18:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-hid-playstation-ratelimit-input-crc-error-v1-1-68812542f898@igalia.com>
In-Reply-To: <20261027-hid-playstation-ratelimit-input-crc-error-v1-1-68812542f898@igalia.com>
From: Roderick Colenbrander <thunderbird2k@gmail.com>
Date: Mon, 2 Nov 2026 06:18:09 -0800
X-Gm-Features: AclHuK-Aber4nLkeUJuI-VHoMCJBO8DQ3A0k5lW5zzgYbYlbxJNc2hnEU0K54f8
Message-ID: <CAEc3jaA_DhowgjeEBJGsUd2-SSWeDkvLbjFJsMeSSWgEqGc04g@mail.gmail.com>
Subject: Re: [PATCH] HID: playstation: ratelimit input CRC check failed messages
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: Roderick Colenbrander <roderick.colenbrander@sony.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, kernel-dev@igalia.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mauricio,

This looks reasonable to reduce log spam.
Signed-off-by: roderick.colenbrander@sony.com

Thanks,
Roderick Colenbrander



On Tue, Oct 27, 2026 at 5:36=E2=80=AFPM Mauricio Faria de Oliveira
<mfo@igalia.com> wrote:
>
> The kernel log of a Steam Deck was mostly filled with CRC check errors
> from what is apparently a bogus controller, with 8174 messages in <200
> seconds, averaging ~43 messages/second:
>
>     $ cat dmesg-pstore.202610250608-0 \
>       | grep -c "input CRC's check failed"
>     8174
>
>     $ cat dmesg-pstore.202610250608-0 \
>       | grep -m1 "input CRC's check failed"
>     <3>[    8.715455] playstation 0005:054C:05C4.0006:
>                       DualShock4 input CRC's check failed
>
>     $ tac dmesg-pstore.202610250608-0 \
>       | grep -m1 "input CRC's check failed"
>     <3>[  196.187459] playstation 0005:054C:05C4.0006:
>                       DualShock4 input CRC's check failed
>
>     $ echo $((8174 / (196-8)))
>     43
>
> Let's ratelimit the input CRC check failed messages for the exceptional,
> high-frequency error case, which doesn't impact the occasional, low-freq
> error case (as ratelimiting does not trigger) or the non-error case.
>
> CRC check failed messages for driver-initiated requests are kept as is.
>
> Testing with a UHID driver to synthetically reproduce input CRC check
> errors (generated by an LLM) shows that it reduces the duplicate lines
> and still provides useful information (number of errors/same message).
>
> For example, triggering such error every 25ms (40 times/second), prints
> 10 messages and silently counts another 187 in 5 seconds, ie, 197 / 5 =3D
> 39.4 times/second (aligned with the synthetic reproducer's rate):
>
>     [    9.554184] playstation ...: Registered DualShock4 controller ...
>     [   10.053936] playstation ...: DualShock4 input CRC's check failed
>     [   10.078162] playstation ...: DualShock4 input CRC's check failed
>     [   10.103447] playstation ...: DualShock4 input CRC's check failed
>     [   10.128739] playstation ...: DualShock4 input CRC's check failed
>     [   10.154016] playstation ...: DualShock4 input CRC's check failed
>     [   10.179198] playstation ...: DualShock4 input CRC's check failed
>     [   10.204474] playstation ...: DualShock4 input CRC's check failed
>     [   10.229762] playstation ...: DualShock4 input CRC's check failed
>     [   10.254904] playstation ...: DualShock4 input CRC's check failed
>     [   10.280441] playstation ...: DualShock4 input CRC's check failed
>     [   15.070695] dualshock4_parse_report: 187 callbacks suppressed
>     ...
>
> This reduces the space consumed in the kernel log during 5 seconds from
> ~200 lines to only 11 lines (5.5%).
>
> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
> ---
>  drivers/hid/hid-playstation.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.=
c
> index f9dc9378cf777d33aab3cdb87302c6e48f406d2f..b053037a3f0b95b6986c7e53e=
787e005676ed565 100644
> --- a/drivers/hid/hid-playstation.c
> +++ b/drivers/hid/hid-playstation.c
> @@ -824,6 +824,7 @@ static int ps_get_report(struct hid_device *hdev, u8 =
report_id, u8 *buf,
>                 u32 report_crc =3D get_unaligned_le32(&buf[crc_offset]);
>
>                 if (!ps_check_crc32(PS_FEATURE_CRC32_SEED, buf, crc_offse=
t, report_crc)) {
> +                       /* hid_err_ratelimited() not used on driver-initi=
ated requests */
>                         hid_err(hdev, "CRC check failed for reportID=3D%d=
\n", report_id);
>                         return -EILSEQ;
>                 }
> @@ -1459,7 +1460,7 @@ static int dualsense_parse_report(struct ps_device =
*ps_dev, struct hid_report *r
>                 u32 report_crc =3D get_unaligned_le32(&data[size - 4]);
>
>                 if (!ps_check_crc32(PS_INPUT_CRC32_SEED, data, size - 4, =
report_crc)) {
> -                       hid_err(hdev, "DualSense input CRC's check failed=
\n");
> +                       hid_err_ratelimited(hdev, "DualSense input CRC's =
check failed\n");
>                         return -EILSEQ;
>                 }
>
> @@ -2425,7 +2426,7 @@ static int dualshock4_parse_report(struct ps_device=
 *ps_dev, struct hid_report *
>
>                 /* Last 4 bytes of input report contains CRC. */
>                 if (!ps_check_crc32(PS_INPUT_CRC32_SEED, data, size - 4, =
report_crc)) {
> -                       hid_err(hdev, "DualShock4 input CRC's check faile=
d\n");
> +                       hid_err_ratelimited(hdev, "DualShock4 input CRC's=
 check failed\n");
>                         return -EILSEQ;
>                 }
>
>
> ---
> base-commit: 83f32c773255720a661aa45d83e36278135f23f5
> change-id: 20261027-hid-playstation-ratelimit-input-crc-error-26f871f1c9d=
2
>
> Best regards,
> --
> Mauricio Faria de Oliveira <mfo@igalia.com>
>
>
