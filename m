Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596002;
	b=e7aEH6Wewi4x1mHYVUBgFSqNHOqd2nVW1IZjRYNHcU8kfUD/B8DgilvJ1GYg3D3hDBLx
	 6RkTLtFjZTzwXdgcwuqQj/FnCiHB7zfn3WzK7gersgi4ZCEWb4gMV/gJwU1/z6wwr1JYe
	 5dhYMfzBzXmFL0C6uEL8RVqSxo+QpFU6R6ZfBcDqX8RxgEFzWiYGCC/Q6Vi0WskE87rKc
	 /UCHaRxaL99ZgT0JN5odKlPJ439+AUyq83t4syQLMUU+uyAFUIYcvO3qzXSTLV/qFInPC
	 /MpW0KU+y+2Vrzi9I5ES4hwWnlxGtHpCe+h0MVTqTuVD65ItgkYr4ZIWaUiIFrIPLCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596002;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=m3I+Od9pV1HSzU7G5XhGnLqggH6YY2zLjNBHaYDLRpY=;
	b=VYiVrDbJbp6cbQVxA2MFEYjWBVZoUMGW5fWmsU7P5WXOxDEIY8GAFBkYB1RjpTCAZ4iU
	 6p3Xr3W9gqKLnsL7UnATigLV2OdJW7GuxNai7g1SHb2eIyI7zBiYGu4ne99qBJoQzwy2p
	 ozKdgZXPoSD8A10aqofNQmPO7n/sUmkjcwS1RI61kFs2nyHdxlSfAkhgzyHQzd4a3b9iX
	 TdlRtfH74T2ZehsiC324W4/cy69VzFMw+s0XcuAAO2G9ZSu2myeVn0N6R0pkpFfb7WcN2
	 icJzdd22L89A4ZKhzyXaK03PY2DwkeBK7hzCRSaMLIZc537AljxDR04GaRbSLwv2qFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ND3JoVh+;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DCB606A88B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63DCB606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ND3JoVh+
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso691302a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:53:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596002; x=1795200802;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m3I+Od9pV1HSzU7G5XhGnLqggH6YY2zLjNBHaYDLRpY=;
        b=grT+6U9rgxPzMTNgoAST73BTZ7STw+ljFwAHTZAdPA49Drq9BC7P1MMdVa5eWZruaO
         ijbdnsIbpVG4tDPv8L+5JwO4Q2f1VVmxSS7sQrT5Vv4fNV+DXHqLifxckUwOptTSQpkt
         vFjTb9Ey6KbxN07QlDnprMXJmhGehRa1EGtdoek7IKx4WU+8GtOiHODP+XKcYRp3QHrk
         IlQdFVJaMGSjI0IipAYmf24RHasrkFlCjzCOzwS6bUwdtXdXhu1dn1n5aUdX/W6GcFme
         tcALKj2Rz/CxQUxzCCrUTti1lqJVnuQAvheiRlWPN6x1LGHtk/KngJFsNd3K38QA22ZR
         oiMQ==
X-Forwarded-Encrypted: i=1; AL+hErFmBIpAKaVER9Fvp/mFfxN4ZxcS1uyCBYogtWl1TnoN53PIrNPVpPQ6PIizGzQlE4E+oT9nJ/S9gdtTiHw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Yq0N4na43vMGW8k+dJN1na6wo5QtdKAZetA2yezREkRDAnJIw
	QtTW0M8lAKmyWCH9rvjGnyYiZHMP7+A4Lyj0QWez09ZAgSBUfquLxaPpn8SC256+RPY592pSaVA
	fmQRaOvpQqfL9a1xEGEIMtXzHz2Q5z0I3Ysph+dDXNwS0gbDJFoN13WFMpSdNLhZ4Gk8dMpmOos
	FSjZDXjKcevJWnmyeUs6EqrwUVpvgqAqN6C/Z4N8FnEFZ4YNWX8OrGKZlBvyq7yE3FI90yfUn+G
	Drfd1MHoIAW
X-Gm-Gg: AYBFou3AUt31sjCQMB22UMqGfPp97MnckcvviL2swSJMGn/WX6jJyGLuXgfchGcB0GD
	bvJkpSPQkDKB/XW5dhsSfaUxbJ8xHMgJIm6nXUn0lK1r/w4stKs+Ivy/hr5kfL7CNfBFNNKpCyw
	fT2jh9YSn4hiYNptJM60NmVtMDsX9Q3tVooLiiE5SI8K1F9QU4zTJ29mfbsBuk4wW9MiCgwzIW1
	e6h+N+HyFpNa45TQSQg5L8S2Wr2Asyt5XftU2qZgQkwA9mlKtwRuFwqtq6uO+EZaywPoq7Y+81y
	ZvhARwjYh7zsSW1MqUG0tZEDLIA0cHixnfHHtK7FeXtVT4Tfqh/3Pvm/Twksp53TTSIF43+enY8
	3Uuwnoa6WQw+umGI/pwVvH66HjqQgm+Wbpz272ghm6l8BTsq+z/6zBA5BaNrrLXRMUn2XumXMRo
	nZewf7L03JGW57pdfEEVfucpAacaqgQRQ=
X-Received: by 2002:a17:90b:17c8:b0:3ac:7842:bd50 with SMTP id 98e67ed59e1d1-3b1b0a428admr3028633a91.15.1794596001498;
        Fri, 13 Nov 2026 10:53:21 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-119.dlp.protect.broadcom.com. [144.49.247.119])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b25dd0d5sm2038638a91.0.2026.11.13.10.53.21
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 10:53:21 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91f0938c499so18159096d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794595951; x=1795200751; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m3I+Od9pV1HSzU7G5XhGnLqggH6YY2zLjNBHaYDLRpY=;
        b=ND3JoVh+MNuuYdaHSCBSVGolaIFyHtIM8iBDaNR7/YZgXlS5egdtdCBQen6i3AKjWD
         FoVEIP7uSlr0Zy8P4Cl+2TAn/IP4Y/Y3kehIImKF9iSsP1pI6aTkq/2azMlDWb6bIMMP
         WZHEoze+N2c5yXBoaxpHAup2HjikuWAsxpXIk=
X-Forwarded-Encrypted: i=1; AL+hErFtdJMxTLNd0glqd7W+SyLnuIwngvSNIg4k2Kh6/pknq8GGpbFnEjb1/YgAEvKnSGW/Hm4M1bnoeOB8q0k=@vger.kernel.org
X-Received: by 2002:a05:6214:cca:b0:91e:f174:bc35 with SMTP id 6a1803df08f44-91f24217866mr51223826d6.27.1794595950657;
        Fri, 13 Nov 2026 10:52:30 -0800 (PST)
X-Received: by 2002:a05:6214:cca:b0:91e:f174:bc35 with SMTP id
 6a1803df08f44-91f24217866mr51223466d6.27.1794595950121; Fri, 13 Nov 2026
 10:52:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <510bf9b037c522ccfba270926c95170291115ef3.1793602003.git.jirislaby@kernel.org>
 <20261113181838.594023-1-florian.fainelli@broadcom.com>
In-Reply-To: <20261113181838.594023-1-florian.fainelli@broadcom.com>
From: Ray Jui <ray.jui@broadcom.com>
Date: Fri, 13 Nov 2026 11:52:17 -0700
X-Gm-Features: AclHuK8Gaa03a6YK8wdIy0hOQJz6AaBzp-hED-7M9ThqtXcPRNrlNZ6SGf6hTsc
Message-ID: <CAJ8Y1dR8L-SzbRMJf5G6eMCa-1mqmpbDJEs3Sa1q8MCkfq1_mA@mail.gmail.com>
Subject: Re: [PATCH v3] MAINTAINERS: fix bouncing {sbranden,rjui}@broadcom.com
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com, 
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>, torvalds@linux-foundation.org, 
	Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Scott Branden <scott.branden@broadcom.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000002ee09e06602cee16"

--0000000000002ee09e06602cee16
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, Florian!

On Fri, Nov 13, 2026 at 11:18=E2=80=AFAM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> From: Florian Fainelli <f.fainelli@gmail.com>
>
> On Mon,  2 Nov 2026 07:47:06 +0100, "Jiri Slaby (SUSE)" <jirislaby@kernel=
.org> wrote:
> > Both emails are bouncing like:
> >   Final-Recipient: rfc822; rjui@broadcom.com
> >   Action: failed
> >   Status: 5.1.3
> >   Diagnostic-Code: smtp; The email account that you tried to reach does
> >     not exist. Please try double-checking the recipient's email address
> >     for typos or unnecessary spaces.
> >
> > According to Florian, it should be first.lastname@broadcom.com.
> >
> > Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> > Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
> > Link: https://lore.kernel.org/all/688738af-100b-48af-bee1-4bcbe4422f94@=
broadcom.com
> > Cc: bcm-kernel-feedback-list@broadcom.com
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: Scott Branden <scott.branden@broadcom.com>
> > Cc: Ray Jui <ray.jui@broadcom.com>
> > ---
>
> Applied to https://github.com/Broadcom/stblinux/commits/maintainers/fixes=
, thanks!
> --
> Florian

--0000000000002ee09e06602cee16
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
Kea1UXiDNimY9XcISXAUrVauS3TPqfSofCP4tOVkOfR2zFsciCJ7DPbmanfMXAR2cY6kCgkZCqxY
9Szy6beT2XZUSE9/jFymRSjXZNnLqAe30YCaVeVQUqW9X3NqlPdzO9Ce8AqKdgBlVt4isO6s3zJ5
djaWSUM3zrweXgaVpSRF3iBUxK45Nb0qOkvz0hrBYM2r+iLWR2YbF+Z7W7lw2QMvkbeT1gXn+4pC
K8f1aWKsB9e6Id7uBOkCAwEAAaOCAdgwggHUMA4GA1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8EAjAA
MIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3NlY3VyZS5nbG9iYWxzaWdu
LmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEFBQcwAYYtaHR0cDovL29j
c3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1UdIAReMFwwCQYHZ4EMAQUD
AzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5n
bG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAyhjBodHRwOi8vY3JsLmds
b2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwHwYDVR0RBBgwFoEUcmF5Lmp1aUBi
cm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQwHwYDVR0jBBgwFoAUACk2nlx6ug+vLVAt
26AjhRiwoJIwHQYDVR0OBBYEFLfOZFpVhKW7s+LOyKdJX5PQH0f8MA0GCSqGSIb3DQEBCwUAA4IC
AQB5Y3tHNG503cqE6g1lZJG3Z1SbuQD8ZXUbYqDNZCnUAd/+zUCraK7TYIOI83X+oof/CscTxVhf
5mazzhESPjHYlC3TLkkxDHQZi06GwKbI00651REpC78vd9dOdZnKnGjpFeDiwJKNxdarSaYiZi/t
6cZD3FIvDaJwYIQ+8HvZOm7FBicC41sMoaxGWZ/tdC6yRoLFckWRvhq0e7wyaBOH2ae8l30V6NXB
RtJd4XemoNk74ybCcGMro0zyBCzQhREo2slK5r/uflroC607XCCIGjLuB6TptSxV97L/9/QSrE2U
4JteFGVwRBJw1s7k8ICf4s22debUZ+OlB0mXjI+8EUDt6vdMeregn5ilQQSsDmBMnz2GzHfV30tb
X92uoE5xui1g4Q3BWkUVwd9wVHaganr3rzc+lQDnQq5cddu1supu3SWp5FqKq36rtf3RX/3zHZ0C
P2pCAlilDHYH2NRF8CYb+gqFySS/PUxwPmFWuD897Hewokex+ux0oZscsuRe0IttCbYfjl/+tSA0
a6Rd+AmkiyASFgEHsLGl6q2OTPYU1PikjUe5RXTp0UC7bdPQXzxaORlh/KWilnz/kV2XblDdybuc
Qz3eVIGvTANnIqPpz94oImrgHX48hMGiH5gGNznLwDBoQl4ZSfvlSi01TcUsYlHJD3LRZWbsh4VG
PDGCAlcwggJTAgEBMGIwUjELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2Ex
KDAmBgNVBAMTH0dsb2JhbFNpZ24gR0NDIFI2IFNNSU1FIENBIDIwMjMCDCsjlIbQJoxUU3h/cTAN
BglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgwsRzD6R9Gy+coGmfGJmRyPH6kfBGzeVP
2iMukDsr/UgwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjYxMTEz
MTg1MjMxWjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJYIZI
AWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEB
BQAEggEALAOFqB/GCKIkE7Ipn1Cot5GUnQRQGwAX/Ln/esno2xP7GxJlRpLruaqiBlO3B+jH5mRN
Z+yqNRBQe+3YUXtBYykspoPNY2aTchUtm9EAWhWG3yvYCYldRQxR1ej2Nev1iRatw1Fg7vOOyFuG
2bVL3f4V3r/A3iy1ZplqZChLYq8+cubyeJW16YxzbHzubANT+9Z6fkvdhYyaTH+EwhwxZ/LRnB7d
XRJqTZwaKe6nEE/1hUcj2sMIu+fi3RTt2HB3i/Fxtdh+BO6Oir+Da8EvfZBpQaQrk3Ba7SrGsfvC
s7+29wXn1pmyq2+Z/Bv2n8ee/ge4Oe/KWrPRX/nEJ0a9/Q==
--0000000000002ee09e06602cee16--
