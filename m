Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794232591;
	b=MYRC+3hjJoLxnE7jI2oJ0gnJVplnQCQ9yHHBsBVe6DCR3UQkwQ1tC+azaW1gpgcTysLp
	 ktB4bkxNCGqiDMdYHt7V80e1Yj71jUlcFefkD8bEiJeeHgj1e+igU8I+5StrfO0yy/sdt
	 y5IjM0Mt+VYZXr8ckXbM8Kw60buPSHfDagXQSRewVDl/JyZdFlLeVDrzJK70rHqqh7cDh
	 Q+egoAeozg0LNvOao3LdyjUsmSCom5iKeOyNlimploJJFf3LYr+WFKe5LqgqEwP6GJB5n
	 FgVCL2TBzr1Fdhg0pDzp+XjOuDYqYFoxkT8WvmpkzYMk98bXVO03l2To2SYWIBCOI+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232591;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=vY2bmS2bCYm6lslVpJ4EMskhujeQne8u0qjJFO+VKxc=;
	b=RNE/4Sgpyx+GFd7PUX8RGnfBYFD4HozXsh4TaPufD3bDibwSfPQwHkQmftm2/cGmkQ25
	 2MNpseWb59ujk0mfHwfWdYjTsb7Q4G7RK8+eAKdYOpBqz+3+svwVCRm7YjAxKFrYD5YoR
	 NmCFY1KL+CzcQ89/obKgg10ZY4SpJiXBdxao5mZyo39HAg/XEUwDOF3hR4nD5zW7NzATc
	 cXvPkJLH6dFSDICW1g9+lmJaq93TnQ9oreM6UE8vGPhzMyIXDXDk/d9QtOjjjYjCOaCqS
	 KPhFe3uy6I0Sxv5AmvdSumo4I26qkZqN9pLtUxK0E43MTOBPUl35gzsUF4oZF814Mvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=OAKJHNoK;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=nEzsNzEZ;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F07606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9F07606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=OAKJHNoK;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=nEzsNzEZ
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A157E1F385;
	Mon,  9 Nov 2026 13:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794232589; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vY2bmS2bCYm6lslVpJ4EMskhujeQne8u0qjJFO+VKxc=;
	b=OAKJHNoKL6i7Sqks4u7MvQZseJPvvoy9sStuLAiFfFjNrtRYlU49rn2bceMoAJRBBZZbBR
	HVHxrtflpZyPZ1Skg668hMCec20xSITLB5y/vQ6vwid4o3dSfWg8dxYBQnRovEi7Tyb/Li
	Ck/6lBcfVPxeYR/Ihamr4oueY+ZxsEU=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=nEzsNzEZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794232587; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vY2bmS2bCYm6lslVpJ4EMskhujeQne8u0qjJFO+VKxc=;
	b=nEzsNzEZ+DesEYoOwXkVrOqE0phvXxC+cex7dMcLMWM89/czpkV6UGq5OecbLZvLDd93xW
	Mb9WV/0wTcbVEesrxs3cTSMNl0rwkjbnyCpd+debF8Ov5heXDYOahpBkfsLaPtWaovhVGh
	EHFWJhPu1Y9FsIr8YZ4lyKvzgMPnHo4=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 591EB13319;
	Mon,  9 Nov 2026 13:56:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wyPDCgvR8WqrRwAAD6G6ig
	(envelope-from <jgross@suse.com>); Mon, 09 Nov 2026 13:56:27 +0000
Message-ID: <50795de6-002b-4c86-833d-30381153ec4f@suse.com>
Date: Mon, 9 Nov 2026 14:56:26 +0100
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
Subject: Re: [PATCH] xen/platform-pci: Disable device before releasing PCI
 regions
To: Teshan Kannangara <tpk.teshan@gmail.com>
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20261013053614.1337340-1-tpk.teshan@gmail.com>
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
In-Reply-To: <20261013053614.1337340-1-tpk.teshan@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1iZSMvoyGNRStrKC30yjZxCk"
X-Spamd-Result: default: False [-9.81 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_SPAM_LONG(2.19)[0.626];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_BASE64_TEXT(0.10)[];
	XM_UA_NO_VERSION(0.01)[];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.com:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -9.81
X-Spam-Level: 
X-Rspamd-Queue-Id: A157E1F385

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1iZSMvoyGNRStrKC30yjZxCk
Content-Type: multipart/mixed; boundary="------------OeG3cEpWprxMspHHwqWpbNgT";
 protected-headers="v1"; hp="clear"
Message-ID: <50795de6-002b-4c86-833d-30381153ec4f@suse.com>
Date: Mon, 9 Nov 2026 14:56:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/platform-pci: Disable device before releasing PCI
 regions
To: Teshan Kannangara <tpk.teshan@gmail.com>
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20261013053614.1337340-1-tpk.teshan@gmail.com>
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
In-Reply-To: <20261013053614.1337340-1-tpk.teshan@gmail.com>

--------------OeG3cEpWprxMspHHwqWpbNgT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMTAuMjYgMDc6MzYsIFRlc2hhbiBLYW5uYW5nYXJhIHdyb3RlOg0KPiAgICAgVGhl
IHByb2JlIGVycm9yIHBhdGhzIHJlbGVhc2UgdGhlIFBDSSByZWdpb25zIGJlZm9yZSBkaXNh
YmxpbmcgdGhlDQo+ICAgICBkZXZpY2UuIERvY3VtZW50YXRpb24vUENJL3BjaS5yc3Qgc3Bl
Y2lmaWVzIHRoYXQgZHJpdmVycyBzaG91bGQgZGlzYWJsZQ0KPiAgICAgdGhlIGRldmljZSBi
ZWZvcmUgcmVsZWFzaW5nIGl0cyByZWdpb25zIHRvIHByZXZlbnQgZGV2aWNlcyBmcm9tDQo+
ICAgICBjb2xsaWRpbmcgb24gdGhlIHNhbWUgYWRkcmVzcyByYW5nZS4NCj4gDQo+ICAgICBU
cmFjayBzdWNjZXNzZnVsbHkgcmVxdWVzdGVkIEJBUnMgaW4gYSBiaXRtYXNrIGFuZCB1c2Ug
YSBjb21tb24gY2xlYW51cA0KPiAgICAgcGF0aCB0byBkaXNhYmxlIHRoZSBkZXZpY2UgYmVm
b3JlIHJlbGVhc2luZyB0aG9zZSByZWdpb25zLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVGVz
aGFuIEthbm5hbmdhcmEgPHRway50ZXNoYW5AZ21haWwuY29tPg0KUmV2aWV3ZWQtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQo=

--------------OeG3cEpWprxMspHHwqWpbNgT--

--------------1iZSMvoyGNRStrKC30yjZxCk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmrx0QoFAwAAAAAACgkQsN6d1ii/Ey8L
Gwf+Ocl2N/2xZdRwwE15aNh8SrKQemvbEq+I60nKuJfyBgvKFAlGeVGbIC3bZXfCVmiORZPa1Kf8
hDFef88sMabyVIwAxXq/yzs3zXDcV1BtXvkjgbAN/2mVBnUfV2g9gIgi1M+PxvXev1h85FqMr60B
QZDCF9vpEfl2sn+pj/iCJjirO8/jCGh9Ia6bkIPwuuuOFfqmQULhqdtJnxU3ngXl1F9VgYUGgnfd
pka69eqmZjbsAUOnqd5Lv23dhQBcxdL1SCHQNURIrNkuDKQmqEPyr9lN+L5bIw/9g/NxijwbiW7M
BDNDsWvU0+FxebPcTBrQvrM5DwCSYZDHkVr80anXWg==
=ZTia
-----END PGP SIGNATURE-----

--------------1iZSMvoyGNRStrKC30yjZxCk--
