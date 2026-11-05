Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893474;
	b=sQUXWX5cWbnS5D8gNOIG7mhaWtrgcCQZe8/zG86XcziGCQnt9KdJBzohC9faENsN5nHo
	 HUvz9bJGNB5aRYbt+xxCUz8RWzAdPMrDP1gKpzlqRRJnUTVSbHd2J1uWDUhpZFCHP0Jwr
	 1AOnxiCvZmPFKQpQ5aukNox/ble51CchTeMrHO295yOHzAvTD0yyg0lGRTBOBs9O7AC5n
	 vS+EZsvzw7S2vzDKstCtKBM7ardicZDZY7vzZ30A5nOMcK0CrK+3acIOCu36Qjg9gRu61
	 SDccZD6lnyR3iecIk9Yb78tPqDzRISJZKdeT1gr2SNnnM1n1BnJSdP1pNWhXVd+VfjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893474;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=YLIbmFK+R/Fw36n/ciHo5ZHHwQNMIuCeppMDWBhSoSI=;
	b=WKBxGl0Cd8S31r2WLc28yIHfFNBVlnynLa7FkYECsb/83oNShyH70Mug3ym2yJvjbEXO
	 PsWGQackjdgim+KShvUDs2agkFvIybfUoGhoGErgUOz5Etsk5timPoPk91y85IQ2q8klO
	 RX/YPXqR1YbwlhVhCiqegPNIlScsaHt0gUt86QzJF06Fx0OG8FStcy32cQpJ5pIyXLp91
	 BMxvo9B/wwt4h0XcACVVmPmXhChdCOeILn2Ta3WU9zMTmsBrI+KTaYEBYDv3liVgoBB4c
	 mvEJsYtFLQ52NsB5EiTZF0UIUm3i0nzTwG29aAyQh3+Up01h00q2hQLY2F0M5+aj43A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=I3dnJgSF;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=WCTJiruW;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249E2606A333;
	Thu,  5 Nov 2026 15:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 249E2606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=I3dnJgSF;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=WCTJiruW
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9748321F62;
	Thu,  5 Nov 2026 15:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1793893471; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YLIbmFK+R/Fw36n/ciHo5ZHHwQNMIuCeppMDWBhSoSI=;
	b=I3dnJgSF/vA4OUdH9xZMYiBSuGokbFhUyeTf4YwAR3l77IrdkP0Z2RfM0ZdFc+XkA4XaTc
	6iyloUY8+3X9ViokEVidjJEpt1ZRRW5kIwHErUrW9gYmI5Kkhvk4Woxjq1DylfuC9+t5pm
	fK90vd92h7F/VQeuo/gIqhHgoWUd1Vk=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1793893470; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YLIbmFK+R/Fw36n/ciHo5ZHHwQNMIuCeppMDWBhSoSI=;
	b=WCTJiruWGtCYi7IpiEfRidcB/XyaxjL4QPfpKdrU93N9l3bVoyQxAjK+3BXTuSobg/36yG
	XCnSiHMZ6IOvWrwxuiajqMukf0VYG9mwOq4J1H2mu8C3/4t6nNujJgBJnk8tlAOyoH5kFv
	C8xjd4f1CYN/Usf1rTTD1glE9rq+Db4=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2C6B1134F4;
	Thu,  5 Nov 2026 15:44:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NkNZAV6k7GpGdwAAD6G6ig
	(envelope-from <jgross@suse.com>); Thu, 05 Nov 2026 15:44:30 +0000
Message-ID: <f5ac5472-da79-4ac5-82de-36b2f5978f45@suse.com>
Date: Thu, 5 Nov 2026 16:44:29 +0100
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
Subject: Re: [PATCH v2] docs: submitting-patches: Clarify half-baked review
 tags
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxKHF7U1x_Ozwpm@ashevche-desk.local>
 <37ae7a7d-5d1d-4571-b5aa-a793f058407c@suse.com>
 <a470cb65-4301-4b19-88fc-3555dff68b4c@kernel.org>
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <a470cb65-4301-4b19-88fc-3555dff68b4c@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dxP6LFKJU8zbYv1Vrlc8sE33"
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-9.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	NEURAL_SPAM_LONG(3.49)[0.998];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_BASE64_TEXT(0.10)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[renesas];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	HAS_ATTACHMENT(0.00)[]
X-Spam-Score: -9.30

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dxP6LFKJU8zbYv1Vrlc8sE33
Content-Type: multipart/mixed; boundary="------------zldPssFHyFjIWbjfHXEgUl9F";
 protected-headers="v1"; hp="clear"
Message-ID: <f5ac5472-da79-4ac5-82de-36b2f5978f45@suse.com>
Date: Thu, 5 Nov 2026 16:44:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: submitting-patches: Clarify half-baked review
 tags
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxKHF7U1x_Ozwpm@ashevche-desk.local>
 <37ae7a7d-5d1d-4571-b5aa-a793f058407c@suse.com>
 <a470cb65-4301-4b19-88fc-3555dff68b4c@kernel.org>
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <a470cb65-4301-4b19-88fc-3555dff68b4c@kernel.org>

--------------zldPssFHyFjIWbjfHXEgUl9F
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMTEuMjYgMTY6MzMsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IE9uIDA1
LzExLzIwMjYgMTA6MzAsIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+PiBPbiAwNS4xMS4yNiAx
MDoxOSwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOg0KPj4+IE9uIFRodSwgTm92IDA1LCAyMDI2
IGF0IDA5OjI3OjMwQU0gKzAxMDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+Pj4+
IFJlZmFjdG9yaW5nIG9mIGRyaXZlciBzdWJzeXN0ZW1zIG9yIHNvbWUgY29yZSBkcml2ZXIg
cGFydHMgb2Z0ZW4gY29tZQ0KPj4+PiB3aXRoIGNoYW5nZSBvZiB0aGUgYWN0dWFsIGRyaXZl
cnMuICBJZiB0aGF0IGhhcHBlbnMgd2l0aGluIG9uZSBwYXRjaCwNCj4+Pj4gcGVvcGxlIGdp
dmluZyAiUmV2aWV3ZWQtYnkiIHRhZyBvbmx5IHRvIHBpZWNlIG9mIHRoZSBwYXRjaCwgbGlr
ZSBvbmUNCj4+Pj4gZHJpdmVyLCBhbmQgaWdub3JpbmcgdGhlIHJlc3QgaW5jbHVkaW5nIHRo
ZSBtYWluIGNvbmNlcHQgb2YgdGhlIHBhdGNoLA0KPj4+PiBhcmUgbm90IHJlYWxseSByZXZp
ZXdpbmcgInRoZSBwYXRjaCIuDQo+Pj4+DQo+Pj4+IEFzIGV4cGxhaW5lZCBpbiB0aGUgU3Vi
bWl0dGluZyBQYXRjaGVzIGRvY3VtZW50LCB0aGUgIlJldmlld2VyJ3MNCj4+Pj4gc3RhdGVt
ZW50IG9mIG92ZXJzaWdodCIgaXMgZm9yIHBhdGNoIGFzIGluICJlbnRpcmUgcGF0Y2giIG1l
YW5pbmc6DQo+Pj4+DQo+Pj4+ICAgICAoYSkgSSBoYXZlIGNhcnJpZWQgb3V0IGEgdGVjaG5p
Y2FsIHJldmlldyBvZiB0aGlzIHBhdGNoIHRvDQo+Pj4+ICAgICAgICAgZXZhbHVhdGUgaXRz
IGFwcHJvcHJpYXRlbmVzcyBhbmQgcmVhZGluZXNzIGZvciBpbmNsdXNpb24gaW50bw0KPj4+
PiAgICAgICAgIHRoZSBtYWlubGluZSBrZXJuZWwuDQo+Pj4+DQo+Pj4+IFRoZSBzZW50ZW5j
ZSBpcyBleHBsaWNpdCBhbmQgY29tcGxldGUsIG1lYW5pbmcgaXQgZG9lcyBub3QgYWxsb3cN
Cj4+Pj4gaW1wbGljaXQgdmFyaWF0aW9ucyBsaWtlOiAidGhpcyBwYXRjaCBvciBwYXJ0IG9m
IHRoaXMgcGF0Y2giLg0KPj4+Pg0KPj4+PiBSZXZpZXdpbmcgcGllY2VzIG9mIHRoZSBwYXRj
aCB3aGlsZSBpZ25vcmluZyB0aGUgbWFpbiBwYXJ0IG9mIGl0LCBpcw0KPj4+PiBtdWNoIGNs
b3NlciB0byBBY2tub3dsZWRnbWVudCwgdGh1cyBBY2ssIGFuZCAiUmV2aWV3ZWQtYnkiIGNy
ZWRpdCBzaG91bGQNCj4+Pj4gbm90IGJlIGFwcGxpY2FibGUuDQo+Pj4NCj4+PiBJIHN0cm9u
Z2x5IGRpc2FncmVlLiBJdCdzIGFsbCBleHBsYWluZWQgaW4gdGhlIHBsZW50eSB0aHJlYWRz
IHlvdSBoYXZlIHN0YXJ0ZWQNCj4+PiBvbiB0aGUgU3ViamVjdC4NCj4+Pg0KPj4+IFRMO0RS
OiBBcyBhIHJldmlld2VyIGZvciB0aGUgcGllY2UgaW4gcXVlc3Rpb24gSSBoYXZlIGRvbmUg
bXkgcGFydCBmdWxseS4gSXQncw0KPj4+IG5vdCBteSBpc3N1ZSB0aGF0IHRoZSBwaWVjZSBp
cyBidW5kbGVkIGludG8gYSBzaW5nbGUgcGF0Y2guIFdlIGhhdmUgb3B0aW9uczoNCj4+PiAx
KSBhc2sgdG8gc3BsaXQgKGFuZCByZXZpZXcgYXMgc3RhbmRhbG9uZSBwaWVjZSk7DQo+Pj4g
MikgYWRkIChwYXJ0aWFsKSBSYiB3aXRoIHRoZSBwb2ludGVycyBvZiB3aGF0IGV4YWN0bHkg
aGFzIGJlZW4gcmV2aWV3ZWQ7DQo+Pj4gMykgaWdub3JlIChzaWxlbnQgYWdyZWVtZW50IHdp
dGggdGhlIHJlc3BlY3RpdmUgc3Vic3lzdGVtIG1haW50YWluZXIncyBvcGluaW9uKTsNCj4+
PiA0KSAuLi5zb21ldGhpbmcgSSBmb3Jnb3Q/Li4NCj4+Pg0KPj4+IChldmVuIHBhcnRpYWwp
IFJiICE9IEFjay4NCj4+Pg0KPj4NCj4+IEkgZnVsbHkgYWdyZWUgd2l0aCBBbmR5Lg0KPj4N
Cj4+IEFzIHRoZSBYZW4gbWFpbnRhaW5lciBJIG9mdGVuIGhhdmUgdG8gbG9vayBpbnRvIHN1
Y2ggcmV3b3JrIHBhdGNoZXMgYW5kIG9mdGVuDQo+PiBlbm91Z2ggZXNwZWNpYWxseSB0aGUg
WGVuIHNwZWNpZmljIHBhcnRzIGFyZSBtZW50aW9uZWQgaW4gdGhlIHBhdGNoIGRlc2NyaXB0
aW9uDQo+PiBhcyAiY29tcGlsZSB0ZXN0ZWQgb25seSIuDQo+Pg0KPj4gSSBzZWUgYSAiUmV2
aWV3ZWQtYnk6IC4uLiAjIFhlbiBwYXJ0cyIgaW4gc3VjaCBjYXNlcyBhcyBhIGZlZWRiYWNr
IHRvIHRoZSBhdXRob3INCj4+IG9yIGNvbW1pdHRlciB0aGF0IHRoZXkgZG9uJ3QgaGF2ZSB0
byBsb29rIGludG8gdGhvc2UgcGFydHMgaW4gbW9yZSBkZXRhaWwuDQo+Pg0KPj4gVGhlIHZh
bHVlIG9mIHN1Y2ggYSBSLWI6IGlzIG1vcmUgcXVlc3Rpb25hYmxlIGluIGNhc2Ugb2YgYSBw
dXJlIHJlbmFtZSBvZiBhDQo+PiBmdW5jdGlvbiBvciBzdHJ1Y3QgbWVtYmVyLCBvZiBjb3Vy
c2UuDQo+Pg0KPiANCj4gU28geW91IGRvbid0IGFncmVlIHdpdGggIlJldmlld2VkLWJ5OiAj
IHN1YnBhcnQiPyBTb3JyeSwgYnV0IEkgaGF2ZQ0KPiB0cm91YmxlcyBwb2ludGluZyB5b3Vy
IGRpc2FncmVlbWVudCBhcmd1bWVudHMgdG8gYWN0dWFsIHBhdGNoIGNvbnRlbnQuDQpJIGFn
cmVlIHRoYXQgIlJldmlld2VkLWJ5OiAjIHN1YnBhcnQiIGlzIHZlcnkgdmFsdWFibGUgYW5k
IHNob3VsZCBiZSB1c2VkDQppbiBjYXNlcyB3aGVyZSB0aGUgcmV2aWV3IHJlYWxseSBhZGRz
IHNvbWUgdmFsdWUuDQoNCkl0IGlzIGRpZmZlcmVudCB0byAiQWNrZWQtYnk6IiBhbmQgSU1I
TyBub3QgaW50ZXJjaGFuZ2VhYmxlIHdpdGggaXQuDQoNCg0KSnVlcmdlbg0K

--------------zldPssFHyFjIWbjfHXEgUl9F--

--------------dxP6LFKJU8zbYv1Vrlc8sE33
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmrspF0FAwAAAAAACgkQsN6d1ii/Ey8v
qQgAnh+mp3x5LmVvSN7XbwGAr417AdUuBFXXo+nV+s1p3ZL3GSKetGJtgBmGia3VYUEoIOw9hagl
WF26EASgCk6RTamB9mtXQV6TPHlw+T+vo4UiU3AqqPgR0MWqkFCe7lBcr+U7OGJh0ctJ5eK1AycZ
UFDjcgbMPlZUOcYd2xgIcBKZk8HZblq9qzRVx0LNoFTKy8/FDUTt8sKOAyC9X+o2vmfRgJaDsLHr
V/BtTBZulNCByynOnGASt9B2bdTv1q+2g1FRqMWD+O5cwOy3QinqO8Po5h87hBDOT2q2Z5mqCW63
myVJRl9n1pWXG2FmBhdjAzALPKMQolE50SoIWJTDaw==
=Ny6j
-----END PGP SIGNATURE-----

--------------dxP6LFKJU8zbYv1Vrlc8sE33--
