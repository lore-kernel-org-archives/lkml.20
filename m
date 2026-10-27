Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793085112;
	b=FgC/YelrmNIW4ZrT4rtJRr7Gqh36UXVC/pz7BCi3+61U5pRWzPB/MSv9QwIUrtMQRBUF
	 NP6fsF/SOB9sKv9p5SpJS3etLT10i3YuVQ28/GQQa5ku4G8cQ17Gl6sYShGjKzf9Q6J55
	 /AoUoDmO4N2gqiKYhuNu/10fv6p3k3DK1nji7XPRYL5WgdWEHp3yL8Kty/cxlCaMcHO1m
	 uSPBZYoP/2NuZVnElZFKUU1L0rgCt/AIn9SVubLImt/CUl4bH1EATDjp2dNA/oKzpvtoK
	 HwXQ7ble3kJT5zxpk+tIM5BHy/mInuyI7dy4ycW/LhFBIo2ImjK+NIMSONo7Skk22uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793085112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type;
	bh=EH91XExHe+HrisujEawnZydcml7ZsQO98SW6GD3uUkI=;
	b=PiAYDZw9q3TmLekJfA0Db4NffXMpjxN2JQ3tFx6nDSVeA5gzd1o9aLAUCwldhUOLBGq7
	 S7VcdEiu0JLqOvmVVCF8XXSRChUOhaN0ODITFII5jjLZESEHbRDeQONf90FPaBvORS9Ut
	 YOuyGHAsyb5j1cXdfnwrorEMuEuXqJNvjHT0tARgOe2yaHVNxwHohY9iYUPadH/8h4zTS
	 CZlKKdQ28I0uSkhK3ysrXkQHDDLFJY1U94I/EUW0Gk4TqunHy5lAEVIp6nlhDsy0mJEJS
	 XINvb6XD5mJueTMvL2VAMPSWsvjL+V0kgTvEtVlN8Qyvz4r/xsJx//YclXqQzuZRY9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FXbmZmR+;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA5D606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:11:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CA5D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FXbmZmR+
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4697404c2bso485436066b.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793085111; x=1793689911; darn=vger.kernel.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EH91XExHe+HrisujEawnZydcml7ZsQO98SW6GD3uUkI=;
        b=FXbmZmR+yp853GcicmkXFqqxN3Y5NjOwWqU39BOKzgr2IfjJWaqHcZptUw5CR0S3KV
         8sQvljEM3iZOhCqEN8Q/rFHy5G8UoxWhFZVisGJoTQkYb8bXwpOfBeM/0Q8U7bDvNPTP
         mJcNNG1DAbNNCI5dq0YJ6DT9RhNCcJR+YOVksdQpqszH+4OqmpAB+wJJ9OXRdSBcCsNc
         Yup8Zj3eS5dYUVdXGpA+Ewnhix912ZmgDkOtfvqf27wkPtruRlVuaZN1Jxu6Mx7pZLJl
         ufhgHadyuf9iaKr0cR5oCfEGoB2O3QtNaGtY5FwtDJJaJF9tkzUrskDaUt+NbWeGSDk4
         OZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793085111; x=1793689911;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EH91XExHe+HrisujEawnZydcml7ZsQO98SW6GD3uUkI=;
        b=S+srS9XYDC877z+NEFp52bvKCwFXZidb9BtdFVvyNKM2Nz8w2xYcuVYcMLZzRZDsio
         ZyQc7ojXExsZgTaGvWIf2i8t7HPmIor+8geF+IAOsvQ0eRqnbU78dnJUA2La4ker25DO
         tBQOG0a1du7JJ5Fnd9c+wkmGQQqRVuoiOWEeNQgWD+YgEHA1kwLbIaM1s+5duN2VMBKa
         sNBhRORzsqShIpsJrIVato8s5SgUoU7Yn2XdVFZ73sfqgsNkk84bMUsBJJl6iIZqKluN
         AE4s6t6CTXqtpBEkt9Ena8dyGm3XCNNqNpuFIa9kjiYVwRuujF3i4uevh56LAVSJigKG
         26lQ==
X-Forwarded-Encrypted: i=1; AKwUvBwb9gBGAI98NJ/fGX3aEX42DkNNTd4pvu/Y90lyhuviqrawwy3tU6sN9+bIxPW1JywIKsWYUtF676NBBsA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/TKz5ggVfbAONnSPNocZdn/O2bKHTW8tBnwJn+roVTcvHLOey
	vbk3tRk+IgWRDyzOTvs+LK5oNCoyAc8zb1LU3SGxq9E2PISQMH2XZpeeiZFTr6YuR48=
X-Gm-Gg: AYBFou3ApdTLrOJhd8KRl5y9OKHcWWY/Dc5UF95Xb/YuZRjUfaBGtsvBDTJ0/HuXZcG
	5uK7uyAmwO/z+VKQVFMUVlAwQhAm/aQFmQl2ouLQDicsHXxZoAUUEhYq7wE2Wq7dvMdCNNVdtOi
	+v+2kLTYw+7PAElwW7GGPRRJ8xUEw6x9CjjJqyCLAkZ10dVBs3SkKCZ6U7uuL6BAIYMrSW3oojG
	2dyVIZUV5wcBJ1jQfpY7/fhHx1DxqsH1U7bAfFOw7Iut+iS0BNiYfC/4pgqmKfN731LrQYdjVE1
	DEwNyRtbS4knGRk7nsII7bIttS+EClRzzw08qsvZriMeeG7T4vQhxNlu6luH2kNkJPxDcfRovX0
	kqt+TaUojCNwml8iOUfo+uvJb+rv2EsBOkHWaKAfsECwvZ9PrxX1xGXgVDNNvYdgNyu5esVx+pd
	LyUD2VlUiXWHDCL6OKjO0cJsMk1bCsgRXR1GYmM2lGeUd6rf1QE9AhDXqj4h907VjTfAul0KUlY
	mbHoRLtqUHBAajoYhzf4SK7RncbI84ZBThWmso+CklpkF89eIzeA6HBAAZleV+/jldi0ZNq04uD
	AJA5oMHPP01Z+nrC1RlRTArogjloBUrGndj8sozzY3Po6P7Hl1st+8IY/wt1v4ecIJLLVHSyKxg
	C2p42Wg==
X-Received: by 2002:a17:906:9fca:b0:c36:179b:6d68 with SMTP id a640c23a62f3a-c46bde2200cmr834285566b.24.1793085110591;
        Tue, 27 Oct 2026 00:11:50 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112? (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de. [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd529b3csm397721166b.37.2026.10.27.00.11.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 00:11:50 -0700 (PDT)
Message-ID: <4c33cc99-3607-41d0-afee-e52a2d8d0144@suse.com>
Date: Tue, 27 Oct 2026 08:11:49 +0100
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
Subject: Re: [PATCH v3 1/5] x86/msr: Switch users of native_wrmsr() to
 native_wrmsrq()
To: Reinette Chatre <reinette.chatre@intel.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Tony Luck <tony.luck@intel.com>,
 Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 Babu Moger <babu.moger@amd.com>
References: <20261026141120.780172-1-jgross@suse.com>
 <20261026141120.780172-2-jgross@suse.com>
 <bf5e5341-f04e-4b34-afbe-55294d67d55c@intel.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
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
In-Reply-To: <bf5e5341-f04e-4b34-afbe-55294d67d55c@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------t3p6QUtaH3WglEyEb9F4kiT9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------t3p6QUtaH3WglEyEb9F4kiT9
Content-Type: multipart/mixed; boundary="------------Jb0jVvEeWwcMtgy4Cgc9vRPS";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Reinette Chatre <reinette.chatre@intel.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Tony Luck <tony.luck@intel.com>,
 Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 Babu Moger <babu.moger@amd.com>
Message-ID: <4c33cc99-3607-41d0-afee-e52a2d8d0144@suse.com>
Subject: Re: [PATCH v3 1/5] x86/msr: Switch users of native_wrmsr() to
 native_wrmsrq()
References: <20261026141120.780172-1-jgross@suse.com>
 <20261026141120.780172-2-jgross@suse.com>
 <bf5e5341-f04e-4b34-afbe-55294d67d55c@intel.com>
In-Reply-To: <bf5e5341-f04e-4b34-afbe-55294d67d55c@intel.com>

--------------Jb0jVvEeWwcMtgy4Cgc9vRPS
Content-Type: multipart/mixed; boundary="------------a60GH6Gy7oGfFUbkNLy8TdkU"

--------------a60GH6Gy7oGfFUbkNLy8TdkU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMTAuMjYgMTk6MzEsIFJlaW5ldHRlIENoYXRyZSB3cm90ZToNCj4gSGkgSnVlcmdl
biwNCj4gDQo+IE9uIDEwLzI2LzI2IDc6MTEgQU0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+
PiBTd2l0Y2ggYWxsIHVzZXJzIG9mIG5hdGl2ZV93cm1zcigpIHRvIG5hdGl2ZV93cm1zcnEo
KSBpbiBvcmRlciB0bw0KPj4gcHJlcGFyZSByZW1vdmFsIG9mIG5hdGl2ZV93cm1zcigpLg0K
Pj4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4N
Cj4+IC0tLQ0KPj4gVjI6DQo+PiAtIHN3aXRjaCBvcmRlciBvZiBoaSBhbmQgbG8gcGFydHMg
d2hlbiBvcmluZyB0aGVtIChSZWluZXR0ZSBDaGF0cmUpDQo+PiBWMzoNCj4+IC0gZml4IGFu
b3RoZXIgbG8gfCBoaSBpbnN0YW5jZSAoUmVpbmV0dGUgQ2hhdHJlKQ0KPj4gLS0tDQo+IA0K
PiBObyBuZXcgY29tbWVudHMgc2luY2UgdjENCj4gCWh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xrbWwvZDYyMzljZWMtMDJkZC00YjRlLWJkZDYtMmJkNmY4OGQ4NzUzQGludGVsLmNvbS8N
Cj4gDQo+PiAgIGVudW0gZXNfcmVzdWx0IF9fdmNfaGFuZGxlX21zcihzdHJ1Y3QgZ2hjYiAq
Z2hjYiwgc3RydWN0IGVzX2VtX2N0eHQgKmN0eHQsIGJvb2wgd3JpdGUpOw0KPj4gZGlmZiAt
LWdpdCBhL2FyY2gveDg2L2tlcm5lbC9jcHUvcmVzY3RybC9wc2V1ZG9fbG9jay5jIGIvYXJj
aC94ODYva2VybmVsL2NwdS9yZXNjdHJsL3BzZXVkb19sb2NrLmMNCj4+IGluZGV4IDA0MDhh
YzdmNjZmZC4uMjRkZWQ0MTY1MmUzIDEwMDY0NA0KPj4gLS0tIGEvYXJjaC94ODYva2VybmVs
L2NwdS9yZXNjdHJsL3BzZXVkb19sb2NrLmMNCj4+ICsrKyBiL2FyY2gveDg2L2tlcm5lbC9j
cHUvcmVzY3RybC9wc2V1ZG9fbG9jay5jDQo+PiBAQCAtMTc1LDcgKzE3NSw3IEBAIGludCBy
ZXNjdHJsX2FyY2hfcHNldWRvX2xvY2tfZm4odm9pZCAqX3BscikNCj4+ICAgCSAqIHBzZXVk
by1sb2NrZWQgZm9sbG93ZWQgYnkgcmVhZGluZyBvZiBrZXJuZWwgbWVtb3J5IHRvIGxvYWQg
aXQNCj4+ICAgCSAqIGludG8gdGhlIGNhY2hlLg0KPj4gICAJICovDQo+PiAtCW5hdGl2ZV93
cm1zcihNU1JfSUEzMl9QUVJfQVNTT0MsIHJtaWRfcCwgcGxyLT5jbG9zaWQpOw0KPj4gKwlu
YXRpdmVfd3Jtc3JxKE1TUl9JQTMyX1BRUl9BU1NPQywgKCh1NjQpcGxyLT5jbG9zaWQgPDwg
MzIpIHwgcm1pZF9wKTsNCj4gDQo+IG5pdDogVGhlIHBhcmVudGhlc2VzIGFyZSB1bm5lY2Vz
c2FyeQ0KDQpJbmRlZWQgdGhleSBhcmUuDQoNCj4gDQo+PiAgIA0KPj4gICAJLyoNCj4+ICAg
CSAqIENhY2hlIHdhcyBmbHVzaGVkIGVhcmxpZXIuIE5vdyBhY2Nlc3Mga2VybmVsIG1lbW9y
eSB0byByZWFkIGl0DQo+PiBAQCAtMjEyLDcgKzIxMiw3IEBAIGludCByZXNjdHJsX2FyY2hf
cHNldWRvX2xvY2tfZm4odm9pZCAqX3BscikNCj4+ICAgCSAqIENyaXRpY2FsIHNlY3Rpb24g
ZW5kOiByZXN0b3JlIGNsb3NpZCB3aXRoIGNhcGFjaXR5IGJpdG1hc2sgdGhhdA0KPj4gICAJ
ICogZG9lcyBub3Qgb3ZlcmxhcCB3aXRoIHBzZXVkby1sb2NrZWQgcmVnaW9uLg0KPj4gICAJ
ICovDQo+PiAtCW5hdGl2ZV93cm1zcihNU1JfSUEzMl9QUVJfQVNTT0MsIHJtaWRfcCwgY2xv
c2lkX3ApOw0KPj4gKwluYXRpdmVfd3Jtc3JxKE1TUl9JQTMyX1BRUl9BU1NPQywgKHU2NClj
bG9zaWRfcCA8PCAzMiB8IHJtaWRfcCk7DQo+IA0KPiBUaGlzIG9uZSBsb29rcyBnb29kLg0K
PiANCj4gVGhhbmsgeW91Lg0KPiANCj4+ICAgDQo+PiAgIAkvKiBSZS1lbmFibGUgdGhlIGhh
cmR3YXJlIHByZWZldGNoZXIocykgKi8NCj4+ICAgCXdybXNycShNU1JfTUlTQ19GRUFUVVJF
X0NPTlRST0wsIHNhdmVkX21zcik7DQo+IA0KPiBXaGlsZSB0aGlzIGNoYW5nZSBpcyBmaW5l
IEkgYW0gY3VyaW91cyB3aHkgaXQgaGFzIGEgZGlmZmVyZW50IHNoYXBlIGZyb20NCj4gdGhl
IG90aGVyIG1zciBjb252ZXJzaW9ucyB5b3UgZGlkIHRoYXQgdXNlIHRoZSBzdHJ1Y3QgbXNy
IHRvIGNvbXBvc2UgdGhlIHZhbHVlPw0KPiANCj4gQ29uc2lkZXIsIGZvciBleGFtcGxlOg0K
PiAJDQo+IAljb21taXQgNDk2N2M0NjZjYTM4ICgieDg2L3Jlc2N0cmw6IFN0b3AgdXNpbmcg
MzItYml0IE1TUiBpbnRlcmZhY2VzIikNCj4gDQoNCkluIG1vc3QgY2FzZXMgdXNpbmcgc3Ry
dWN0IG1zciB3YXMgdGhlIG1vcmUgZWZmaWNpZW50IHdheSB0byBkbyBpdC4gSSBhZ3JlZQ0K
dGhhdCBJIGNvdWxkIGhhdmUgYXZvaWRlZCB1c2luZyBpdCBoZXJlIGFuZCB0aGVyZS4NCg0K
PiBJIGFtIGN1cmlvdXMgZXNwZWNpYWxseSBzaW5jZSB0aGlzIGNvdmVyIGxldHRlciBub3Rl
IHRoYXQgdGhpcyBwYXRjaCBpcyBiYXNlZCBvbiB0aGUNCj4gc2VyaWVzIHRoYXQgdGhlIGFi
b3ZlIG1lcmdlZCBjb21taXQgaXMgZnJvbS4NCg0KVGhlIGJhc2UgaXMgbWVudGlvbmVkIGlu
IG9yZGVyIHRvIGF2b2lkIGNvbnRleHQgY29uZmxpY3RzIHdoZW4gYXBwbHlpbmcgdGhlIHR3
bw0Kc2VyaWVzLg0KDQoNCkp1ZXJnZW4NCg==
--------------a60GH6Gy7oGfFUbkNLy8TdkU
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------a60GH6Gy7oGfFUbkNLy8TdkU--

--------------Jb0jVvEeWwcMtgy4Cgc9vRPS--

--------------t3p6QUtaH3WglEyEb9F4kiT9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmrgTrUFAwAAAAAACgkQsN6d1ii/Ey/7
nwf+L01daDM2KERHrwF4nzpdlRavPpIIt23fN8LjD/rh9XhWCQfjx4K+3WpzgCmDB4Wu2TuJh4u6
Rnl6nYlLvReHZ/KKOe3PVxLTDjSAX/hkg6VcUisgdTItmz52wWPKtpfl5drA8PIdKiNz2G2CJkBo
rNA1RvOA9drkon6vcnmCJdAyEdLCG3Ib6pbmyUTUlLes27PKaf+XSY4kpde+wwIZptsN0eOt+4lS
GrfrARkt7UG+Z6GsThQdBBa/YfUIjd/beplpJn/s9LnQLF5APBasGgCBlpqHvKT6vv4RGXhKwW98
YTv1jTwKQzudfM50ThlH5KT+vbHI1I2pbjB93mEQfw==
=DQBP
-----END PGP SIGNATURE-----

--------------t3p6QUtaH3WglEyEb9F4kiT9--
