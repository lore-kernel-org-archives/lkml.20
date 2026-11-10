Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794277973;
	b=ZeJ2gd7tCgxhXoyAeQZBA2gtxsohjgfq1FfrdpvMM+pJjgRy3g7VjG3Re0snHX7SsOYf
	 yoWOpXc1ZlfNojm8MuiUBXJuWpEcTW91wAxLIjiXYtX8dJCIMTLmvdf/CtBi3G4Dk4kgQ
	 49E91MOUpbzmfuegg776yXcT/zLr98IMUjtuxXirkxnB01FpNqyoaSeDruqQgNOhdi2e1
	 ZCbmywVEKFKmj6ojRz4BlCPSAKywUmyVcHGtiohFZjF2DFueEr5axLHONhJres1xekOEk
	 mEi6zbSD7HAVG2f+kaoqiPGdT8wJ/CrRCwOYS8Dul4Z2QCP3xYo1t1OgzquvmWdb0iw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794277973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=+UEXnv8sO59biXTVUGJWsxHSY+X/qyvekpO21DXG97s=;
	b=ujN38iRQeQpfiSxaraZ/3zO8kuxIqVbPFOyoCbFDEhKEwRTZ30k7eBpdVcAF/LKewT/J
	 dgqgC5vbbr+pKzgG4P7As4pzHD1+4u19ORRTDwmTpokRLhYfIqx8kMkBr0MCpzYRj1rJh
	 MPsOyDRj7hWdrOiJSBrbm2vRnSFObY8sz1MM02hWTetDCHxq0RXrpO0chmQXp5Y14wMil
	 wbkA901dhD+qMXJY7YbvcGzOjD0P+KOs4xOHuaDpdjIp7ako/r0m2kgBUIqRLFFZmCXh/
	 YKbTNXN0axbnCkR/ZhQy0SSlo/O1nwFKgFYD4anxLz0ZZabSzCup/kcBoU6PcpILuWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kN8usH9I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B68B606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B68B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kN8usH9I
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b577addee9so2089535a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:32:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794277972; cv=none;
        d=google.com; s=arc-20260327;
        b=ji3WWtq9hQcCLC5RA1Ar80xqk1WetHFU8LZTtAdySiISUIpqhgfLhZSRanGN9nsyZE
         saTnXOojNf+6zncNeme0+if5rhYINFVnPShvk/zBbGPhJrZsEOZnwSF0NEevAFAaghr8
         5pA7/uSpTDhxni8q0Fp/CeTE7wQ2HQ1uc+6ECJ2zLRDP0/52UM0g0NvXDu+K5V2fdz9o
         mQE+p+vhMkySmUdAiADtliRLKzEZsKdNFgEqikttTnnsvF7gl6KoxcAbD0EoAlsQViQD
         03xL5rGDy9PZbnZd6C7ImcEYSvGkiJ/rPYtjSSYYJ9v9RLHEQDpVwXaadAuEscXeLEQV
         +qOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=+UEXnv8sO59biXTVUGJWsxHSY+X/qyvekpO21DXG97s=;
        fh=b8VaiIidPgW3sdY6Pbt6hD2MbSiAKMJGryAEa4zV7XI=;
        b=LXfd/3y2ztuLlYTo33JTc/ItI3rznHK3FTp/7E67KXK8r4QvnG8YKOCbx0IVAfPfz+
         NWJwi6bsKMhDvqa1JWfbddM/E914sE/bwRMPzX8DDSiCFbLTMWf4AQ6AVu5fOE8tLRWV
         IbnZYCyh+0dLAOI7167NkBidEHOSm05V52oZuIE0H8TFXAz2UPTxFOLzX73P55OlnWUg
         +FpvE/JH9ZDaeTzTlK2kTgXqWJ3u0uOiOxUTQjD9lwHe5uh/ANtlmEuZX3L2HIX79tRF
         dK+ZAcP8x+VbC9SHDl0IAaR54XSQvK6ODL9lcAnYDnRJZUQvt6Y6r7fqZau5X11QlhGn
         nFrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794277972; x=1794882772; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+UEXnv8sO59biXTVUGJWsxHSY+X/qyvekpO21DXG97s=;
        b=kN8usH9IU49ojTSFWxPbJVZ+ZPL9HfmyxBuwCulgrTZp/vIkQ2G69w6Y2yovNv946E
         bJzgBQHvSOFygF+KiU2KfzjtI0OAeGZi9VL3lKD+AvhAVGOQmot95xbnAbg2A4CaqsCf
         eTZ8KFJ96l3FwkAU/lwTHaXnrTtHfa2PYj99p6cQOQJSjiD4KSRMNhMDCcuyLBKNz9Os
         tSQbuty+GYOY4ZQ2vek1GcljQVgKSwQkRuubGXyLCTQolhUdTNTRmgmjxNwLUn2vfeXd
         12WP15h/MMthSPTaba6ldVBkatiFdKp89KUiyAAfiQLjEErfYKq0VKNkyG5HIpvzN859
         aeqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794277972; x=1794882772;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+UEXnv8sO59biXTVUGJWsxHSY+X/qyvekpO21DXG97s=;
        b=TvNDSQo9TEqxECepKPLIsQe6FmKcYUevNaB0le+gE9fiBqZDwoDRH8sx04QLTguUyL
         bntVCc+W0rYvTfcWrj/0TpldLgeeAiQtvNWuq4mzbAE4ouzVm/z8UokqkLjz9zUsB0hD
         JCrRpY5moj9kikkVyjVDp5DRZKksxxgHH9nNsv2AnA+jUUfPogvZM1v91CMxYJHZv7Yb
         2ciinmgsQ2IBiM9nlhjPLADCKL0P/p5eO/nQkz+Xs5ZojxD71xyLqmWJzWEBkiCfUhsR
         9Lyinjy/3orkcrAq5THeCwp6Uv5I15IFvZIYVuGeU+WjO8b3zzsC8gFvJ9z+nSzgG2rU
         Qpvg==
X-Forwarded-Encrypted: i=1; AL+hErGCDtZCASAEz+qXoDeVmVmNosfvr30G/CWSpn/dI7lUSWZ17OtkvxUrrV0FgvmmyW7i2IcT8CMdotVNYG4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JGUbldQGIoRBBxFFAyGIkTTmnEsHHUqJvvoQ1kc6yBS4uAeUW
	YF1sof9ACZEeXYai9cLjvmLkyqBwfcbE3CHArje4eW8r+malRhuP268AARqH9FlBDmW0tMZAO5H
	DJ6oIKAuUJD+Dwp4nNtgkpmIzhvL26A==
X-Gm-Gg: AYBFou3Y3VTnV+qHZuLkYvVz2DfgB65SgTpscoOZzocn3LiMnrcHbWE9c21v/ddSXKg
	wSbJKFo9g80qFILXiYMWgvxU+7/2p4h2zyR97mEMEgnnF80lY7vZVFbF9VlNWsjVOeUy3PwT3gm
	q80pcT7IxewURyVZw+OGjbJCm1epmWjLa5kM8PKfPmj0x8Ibrm6axItrOOtI+yZTpq2Zo3rduCw
	4AaG3C40wgX4nlWwGFW5NhX099ge55IkFmZcq7cIfsF4GfuYOx68Yus0Ac2eSLip3NXHag6iejK
	gOZ1+JeJ41/vY/qzAl6WAVfO2tH45ucwkh5DtacG+gEBwv2Tn9tzVb/EKjKNIU6zzxtklQ5S5++
	WEIR7ffedaPgXgMlpg0uJcj8KV8Lx9ChwcobB5xa2xgexenjVtMeVf0pbLzRgpqBM3VNU54c8+B
	F+smc9kX9boSH+iBGA0zs3SLycs5U5DYTuzEZ0W6n8g98F
X-Received: by 2002:a05:6402:a507:10b0:6b1:8818:1090 with SMTP id
 4fb4d7f45d1cf-6b7568dc1e7mr684976a12.22.1794277971764; Mon, 09 Nov 2026
 18:32:51 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 10 Nov 2026 02:32:49 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Myeonghun Pak <mhun512@gmail.com>
Date: Tue, 10 Nov 2026 02:32:49 +0000
X-Gm-Features: AclHuK8AIkgNRXamUPSojUGsIPAwgEr26dHrd-qWTZA7kFbE804fLktH5iFVef4
Message-ID: <CAGEsz8Gb=4JS4OAFKppe=LW6JYa2ssJ8APdJJX2Ou_BhzEvZxg@mail.gmail.com>
Subject: [PATCH v2 0/2] mfd: wm831x: Fix IRQ mapping and cleanup
To: Lee Jones <lee@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Ijae Kim <ae878000@gmail.com>, 
	patches@opensource.cirrus.com, mfd@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Lee and Dmitry,

This series fixes WM831x IRQ resource mismatches and follows Dmitry's
request for managed onkey IRQ/work cleanup and MFD-provided mapped IRQs.
The provider and consumers are converted together to keep their IRQ
resources consistent.

Changes since v1:
- Use managed IRQ/work cleanup instead of storing the onkey IRQ.
- Move IRQ mapping into MFD and update all platform consumers.
- Reject failed mappings and unwind consumers before removing the domain.
- Retain polling for release detection; the chip only interrupts on assertion.
- Drop the previous Reviewed-by tag because the implementation changed
  substantially.

Compile-tested with LLVM, W=1 (arm64), for all 11 changed C objects.
No hardware testing.

Previous discussion:
https://lore.kernel.org/r/atJycIEnUZKVdTjW@google.com

Thanks,
Myeonghun
