Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793813053;
	b=3MB4UJrHbIeTIo1Ce+wmuuE4S8HpNa+pcj9yAyP1rObcadsFrW8acc/e0OrHcRPRYkwn
	 OxlarbO11QIU8hgPeKRhmEpr2iFSTJENZxXf+mOlT3yqbSTkoDj4V+qjAqKpuneeslk9f
	 XGL32A2a8Fgr/5ANPe4ATi87/H3jrdOfusI+EwC9ar7D/euBW+AJd9TQYPmbi9+D/Nj4Y
	 7Qe7mI1tB0ZOOvQot0ZVPc8aqGMDt4u/Fmz/FO5Cj++oRP235HoT1oY4fiefYTHHwxlmn
	 e6OXpS6xjYGYnrrpN0Kpt97BGRidq4Y6NJm/Vl1BgZjRgQnV8gBnsLzx//ULdQ63O2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793813053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=KJ6VISWospHgYw8r3RLcWmStVXedmzrG4Mzjiqw8u3g=;
	b=Ou8UFiTzO+vEs8XcziiiVs7j5wyu+p2e3Zzh98rSyNKp4rFiK1q4CDPl3jJbDLH3FnaE
	 CtvX8xYG1k4pwSX6sElyNFiq9cdykKrKjcyiZdB6vPdD5MuRQGHWxfpcit2nSaNd4f2R+
	 W8Bq9jdpbkIsz8HBWpW04y4cwdm+p2imtRo/LKe5midzvdsi/jwIpdAOMQBONVuNk10lg
	 fAxkM3eSj+cqZ2fU1QI2bZ5JZ/LV2C9+28YFwOD+FNq9ikQfRt+bRRcHgRiuPzeFeHOxx
	 a0Ged1OTZ/gwPt1NeaYzLvbO6Svt+Q3IlxQTVGYJBzQ8xky6far9aBb1J/063rBRlzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wc+AbIDQ;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB43606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:24:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DB43606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wc+AbIDQ
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48df54150dfso673936f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793813051; x=1794417851; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KJ6VISWospHgYw8r3RLcWmStVXedmzrG4Mzjiqw8u3g=;
        b=Wc+AbIDQjwboDUfssHTFxKoUosrOYYPxrV6kw7i0TjQIco1rDmhZbhvR2S/o9h6Pe9
         P0p44wk2wXLv77EKwW94aa1ng19+eBkLHdUzTl0DYRmYOwPP26pQ6vhXR32ZLkz7xVV4
         9OlbVAowbknyKoxuzSv75cBsuSOrINYPhOlA3loBXpFokKPjbMMwYQ6dGl6HiXkBwfif
         0GTznnKiLZ4gJKSRsoWi3AGCACiO18kHzLcGc5B5JEaFQgW3wJrXK+brQ5qc/COxSmg+
         HDZOsjjHs50toWS8olorj+nY1B6DhZga8jMjByfPAxZhdJ45Oc6/Ec3WsUc1BdFhFXsW
         FQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793813051; x=1794417851;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KJ6VISWospHgYw8r3RLcWmStVXedmzrG4Mzjiqw8u3g=;
        b=I0wJ1zkMaRfGbRxNqwAQoteydhB8CH2QG27f6a6AJ+mIVdVNemWfiunHP+glC67ZIb
         cVGP+GzyKXVFh8C8b8GFxDjC0aI/iIVuuLGI9XCJWiCMN1zUacshGeISg8tqwvd/KwBN
         X4MDkBCGGP9BGHpLccTjwHBwXkLZZPaqKvLvAEBWzBym5SOMikZ+WAGnWzopt2mYRgzf
         QPsdegUba4c3C+UPz3tqa4N0dFpQ3mSyHiC3z5ZUvPXswfIB/GNY/ZRFoP57baSTWsGb
         zmz7xxK6D05C7WHU9trw/E6qN4ZWsPIiw6HJDlNXzS38PH93U/OAEaeuYSyJSy4T4mxR
         jdEg==
X-Forwarded-Encrypted: i=1; AKwUvBxqEawGkX0NeQ+7sW9V670i/t1W8CzZoVSPt0cezWZ7wh/g/OMKNtWJ75Kjy9zuJzyhLng8TgCbYLWFoj4=@vger.kernel.org
X-Gm-Message-State: APuU4Z94Hk9r69OznpTI7OL0DRb4MCl8ZEiN3HP0vwNCnqEkj31yM45S
	KhJbe6C6w99pY3khK1yZANR2d4PASyENO5hX0ysnize+QHGsRV55ni7W
X-Gm-Gg: AYBFou3dElgY13NPrbEGkOlC1RMkZb6Soy9xTaSlcJqPVk56/boE+OsRUdaoHS2vIWB
	D6bp1x55XjRoDz4a30LrUP3ooRGMmKgDblQD9/lZTtl6+4BhniK1ZJt55lcBkHVQT0Oce/7/0DH
	9nipM4FnJRmEX/OvkndbNOmrAa3xqyhwRZIKgb6uxw4Sdjva7TscgF2xSFC8o4n6WiX2E6qkS9y
	rP23+Q6EDR2e+C7mc/1hrScgCabUrJSwPExy6Ri0UUmdgOnsBMgFbaJU4CrfzD0qyBIMwHqULKV
	jqq6rkO2AGntxDrpnf8HKiT06TSEZ4ruIZEbkhIQc+6HbbBiNMGmcdULhSQpfwtmGEFZ1LhaurZ
	+efQD9+3UVb3EdxrVz7DAIFmdOauQQ5DzpZ7fXfQyoXEGyjFS+upqDzNtgF5kgXd+VB2ycsSSL1
	s9LhnKmksa/6JO/GACqaHui6GxR/s/k8sVE/LM/Djiopwf9h3zGNOf0C8No2VZQQR6fmqa5CwDB
	YtfysNY8krN+hVexEvaHnTxNymGnbn7/lWqnAk7SKDgR7OSn7drtY/zOhVM1MMlRofQ/JqFWUmO
	l5BDSTK1ExfRmxa0rAdzZb/I5kLC4FQwtAtNOXFfitD6pMbVIxUl+/llEziLmaLrhrAby8L3OeA
	TCFU0
X-Received: by 2002:a5d:5f85:0:b0:490:d197:bde8 with SMTP id ffacd0b85a97d-490d1a700a0mr1652639f8f.0.1793813050825;
        Wed, 04 Nov 2026 09:24:10 -0800 (PST)
Received: from rillian-arch.localnet ([2a00:23a8:8f4:6a01:5ffc:da36:c891:cd3c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac2772sm4779319f8f.18.2026.11.04.09.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:24:09 -0800 (PST)
From: Rillian Grant <rillian.grant@gmail.com>
To: Lee Jones <lee@kernel.org>, Ruslan Koreev <koreev.r@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v3 4/4] leds: flash: lm3643: Describe the LED on the Lenovo
 ThinkPad X9-15 Gen 1
Date: Wed, 04 Nov 2026 17:24:04 +0000
Message-ID: <IvA-bOWrRpaeGbjjXz1l3w@gmail.com>
In-Reply-To: <20261021144034.1636708-1-koreev.r@gmail.com>
References:
 <20261011191026.149338-1-rillian.grant@gmail.com>
 <179198409516.839288.2293417415100693160@kernel.org>
 <20261021144034.1636708-1-koreev.r@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart3G_yHyoEQi2GJmRMCtpajw"
Content-Transfer-Encoding: 7Bit

This is a multi-part message in MIME format.

--nextPart3G_yHyoEQi2GJmRMCtpajw
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi Ruslan,

On Wednesday, 21 October 2026 15:40:34 GMT Ruslan Koreev wrote:
> Rillian, could you share the relevant SPB trace, including mode, current
> and timeout writes, together with the installed driver version?

Driver versions: the X9-15 Gen 1 values are from the Windows install on
my machine. The X1 Carbon Gen 14 values are from the current package on
Lenovo's support site.

X9-15 Gen 1:
- lm3643.inf/.sys 70.26100.2.18321 (02/20/2025)
- IR sensor: HM1092, hm1092.inf 70.26100.2.18321
- FlashLEDsIntensity = 0x3C64 (lm3643.inf)
- IRFlashLedIntensity = 40 (hm1092.inf)

X1 Carbon Gen 14:
- lm3643.inf 71.26100.10.21060 (08/05/2026) however lm3643.sys contradicts
  with 71.26100.23.21060
- IR sensor: VD55G1, TBE0020A1.inf 71.26100.10.21060
- FlashLEDsIntensity = 0x3C64 (lm3643.inf)
- IRFlashLedIntensity = 30 (TBE0020A1.inf)

Both lm3643.inf files bind ACPI\TXNW3643 and ACPI\INT347D. Apart from
the version, they differ only in where DeviceCharacteristics/Security
are written. The registry on the X9 matches the INF defaults.

Before I submitted the DMI software node patch, I had seen that the
Carbon had a different driver version and a different IRFlashLedIntensity.
That is why I didn't reuse its values for the X9.

I traced Microsoft-Windows-SPB-ClassExtension (analytic) during a
Windows Hello face unlock on the X9. Every write to the LM3643 is
preceded by a read of the same register. Register decodes are from
SNVS967A.

Start of the session (once, after the controller entered D0):
  R 0x0A=00  R 0x0B=00  R 0x01=03  R 0x0C=02
  R 0x07=09 -> W 0x07=09   boost config, POR default (2 MHz, 2.8 A ILIM,
                           short detect on)
  W 0x01=03                standby, LED1+LED2 enable, TX pin enable off
                           (POR is 0x80)
  W 0x08=00                no torch ramp, flash timeout 10 ms

Per pulse (repeats every ~133 ms):
  W 0x01=03                standby
  W 0x08=0F                no torch ramp, flash timeout 400 ms
  W 0x03=99                bit7 = LED2 flash current override (LED2 = LED1),
                           code 0x19 -> 25 x 11.725 + 10.9 = ~304 mA per
                           LED (~608 mA total)
  W 0x01=0F                flash mode (M1,M0=11), LED1+LED2  <- LED on
  ... ~65 ms ...
  W 0x08=00                timeout set to 10 ms while the flash is running
  W 0x01=03                standby                           <- LED off
  R 0x0A=01  R 0x0B=00     Flags1 bit0 = flash time-out flag (0x00 after
                           the first pulse, 0x01 after every later pulse)

This unlock had 6 pulses. The last one was turned off after ~3 ms, once
the face was recognised. The driver never wrote the torch registers
(0x05/0x06) or the LED2 flash register (0x04), and never used IR mode,
STROBE or TX. The only values written to 0x01 were 0x03 and 0x0F.

The LM3643 transactions with timestamps are attached. The raw ETL/XML
trace is available on request.

--
Rillian Grant
--nextPart3G_yHyoEQi2GJmRMCtpajw
Content-Disposition: attachment; filename="lm3643-trace.txt"
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"; name="lm3643-trace.txt"

10:47:24.493347  LM3643 W 0x0A | R 0x00
10:47:24.493427  -- controller 0x3CF250DE2738 D-state 0x1
10:47:24.504454  LM3643 W 0x0B | R 0x00
10:47:24.504748  LM3643 W 0x01 | R 0x03
10:47:24.505018  LM3643 W 0x0C | R 0x02
10:47:24.505315  LM3643 W 0x07 | R 0x09
10:47:24.505564  LM3643 W 0x0709
10:47:24.505741  LM3643 W 0x01 | R 0x03
10:47:24.506021  LM3643 W 0x0103
10:47:24.506229  LM3643 W 0x01 | R 0x03
10:47:24.506479  LM3643 W 0x01 | R 0x03
10:47:24.506736  LM3643 W 0x0103
10:47:24.507080  LM3643 W 0x08 | R 0x00
10:47:24.507317  LM3643 W 0x0800
10:47:24.507537  LM3643 W 0x01 | R 0x03
10:47:24.507777  LM3643 W 0x0103
10:47:24.507935  LM3643 W 0x01 | R 0x03
10:47:24.508181  LM3643 W 0x0103
10:47:24.552953  HM1092(IR) W 0x010000
10:47:24.632548  HM1092(IR) W 0x010001
10:47:24.669203  -- controller 0x3CF250DDE738 D-state 0x1
10:47:24.675057  LM3643 W 0x01 | R 0x03
10:47:24.675520  LM3643 W 0x0103
10:47:24.675806  LM3643 W 0x08 | R 0x00
10:47:24.676278  LM3643 W 0x080F
10:47:24.676575  LM3643 W 0x03 | R 0x99
10:47:24.676857  LM3643 W 0x0399
10:47:24.677059  LM3643 W 0x01 | R 0x03
10:47:24.677316  LM3643 W 0x010F
10:47:24.681780  IMX471(RGB) W 0x010000
10:47:24.741365  LM3643 W 0x08 | R 0x0F
10:47:24.741647  LM3643 W 0x0800
10:47:24.741872  LM3643 W 0x01 | R 0x0F
10:47:24.742178  LM3643 W 0x0103
10:47:24.742372  LM3643 W 0x0A | R 0x00
10:47:24.742621  LM3643 W 0x0B | R 0x00
10:47:24.742969  IMX471(RGB) W 0x010001
10:47:24.807808  LM3643 W 0x01 | R 0x03
10:47:24.808069  LM3643 W 0x0103
10:47:24.808246  LM3643 W 0x08 | R 0x00
10:47:24.808503  LM3643 W 0x080F
10:47:24.808776  LM3643 W 0x03 | R 0x99
10:47:24.809023  LM3643 W 0x0399
10:47:24.809178  LM3643 W 0x01 | R 0x03
10:47:24.809456  LM3643 W 0x010F
10:47:24.874410  LM3643 W 0x08 | R 0x0F
10:47:24.874691  LM3643 W 0x0800
10:47:24.874913  LM3643 W 0x01 | R 0x0F
10:47:24.875165  LM3643 W 0x0103
10:47:24.875371  LM3643 W 0x0A | R 0x01
10:47:24.875619  LM3643 W 0x0B | R 0x00
10:47:24.940847  LM3643 W 0x01 | R 0x03
10:47:24.941139  LM3643 W 0x0103
10:47:24.941306  LM3643 W 0x08 | R 0x00
10:47:24.941552  LM3643 W 0x080F
10:47:24.941768  LM3643 W 0x03 | R 0x99
10:47:24.942104  LM3643 W 0x0399
10:47:24.942271  LM3643 W 0x01 | R 0x03
10:47:24.942513  LM3643 W 0x010F
10:47:25.007386  LM3643 W 0x08 | R 0x0F
10:47:25.007683  LM3643 W 0x0800
10:47:25.007896  LM3643 W 0x01 | R 0x0F
10:47:25.008160  LM3643 W 0x0103
10:47:25.008322  LM3643 W 0x0A | R 0x01
10:47:25.008577  LM3643 W 0x0B | R 0x00
10:47:25.073907  LM3643 W 0x01 | R 0x03
10:47:25.074207  LM3643 W 0x0103
10:47:25.074392  LM3643 W 0x08 | R 0x00
10:47:25.074649  LM3643 W 0x080F
10:47:25.074867  LM3643 W 0x03 | R 0x99
10:47:25.075123  LM3643 W 0x0399
10:47:25.075366  LM3643 W 0x01 | R 0x03
10:47:25.075621  LM3643 W 0x010F
10:47:25.140383  LM3643 W 0x08 | R 0x0F
10:47:25.140639  LM3643 W 0x0800
10:47:25.140858  LM3643 W 0x01 | R 0x0F
10:47:25.141103  LM3643 W 0x0103
10:47:25.141266  LM3643 W 0x0A | R 0x01
10:47:25.141507  LM3643 W 0x0B | R 0x00
10:47:25.206938  LM3643 W 0x01 | R 0x03
10:47:25.207270  LM3643 W 0x0103
10:47:25.207443  LM3643 W 0x08 | R 0x00
10:47:25.207689  LM3643 W 0x080F
10:47:25.207897  LM3643 W 0x03 | R 0x99
10:47:25.208150  LM3643 W 0x0399
10:47:25.208318  LM3643 W 0x01 | R 0x03
10:47:25.208581  LM3643 W 0x010F
10:47:25.273481  LM3643 W 0x08 | R 0x0F
10:47:25.273782  LM3643 W 0x0800
10:47:25.274032  LM3643 W 0x01 | R 0x0F
10:47:25.274303  LM3643 W 0x0103
10:47:25.274485  LM3643 W 0x0A | R 0x01
10:47:25.274721  LM3643 W 0x0B | R 0x00
10:47:25.339949  LM3643 W 0x01 | R 0x03
10:47:25.340239  LM3643 W 0x0103
10:47:25.340418  LM3643 W 0x08 | R 0x00
10:47:25.340684  LM3643 W 0x080F
10:47:25.340932  LM3643 W 0x03 | R 0x99
10:47:25.341210  LM3643 W 0x0399
10:47:25.341406  LM3643 W 0x01 | R 0x03
10:47:25.341660  LM3643 W 0x010F
10:47:25.344654  LM3643 W 0x08 | R 0x0F
10:47:25.344956  LM3643 W 0x0800
10:47:25.345171  LM3643 W 0x01 | R 0x0F
10:47:25.345419  LM3643 W 0x0103
10:47:25.345575  LM3643 W 0x0A | R 0x01
10:47:25.345808  LM3643 W 0x0B | R 0x00
10:47:25.473344  HM1092(IR) W 0x010000
10:47:25.474241  LM3643 W 0x08 | R 0x00
10:47:25.474501  LM3643 W 0x0800
10:47:25.474715  LM3643 W 0x01 | R 0x03
10:47:25.474956  LM3643 W 0x0103
10:47:25.475106  LM3643 W 0x01 | R 0x03
10:47:25.475403  LM3643 W 0x0103
10:47:25.486367  LM3643 W 0x0A | R 0x01
10:47:25.486763  LM3643 W 0x0B | R 0x00
10:47:25.623971  IMX471(RGB) W 0x010000
10:47:27.620034  -- controller 0x3CF250DE2738 D-state 0x4
10:47:28.631808  -- controller 0x3CF250DDE738 D-state 0x4

--nextPart3G_yHyoEQi2GJmRMCtpajw--



