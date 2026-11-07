Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794047749;
	b=BNqX2oCyax97lNEj53GCUCPtfhfE0B2V68WUX7TshUW94x3L3DN3w59U02Ui1nq3cubk
	 YnqnyWX228RhGtGizRL1mz4F7toPj1vL0wk6wapMkWqtW6VxzZfU9tc4SoCCWOAMozMJF
	 yxeRQ2ja6aEUxReA4hwy7yhA1vjYDy8Av6I2Ii7XlSTN3+8p4CvL3kHKmq2pglAMlLFoc
	 isBBnhjpYM3CDBleHSBf6dDS254CCpdY9yJae61rahH3CgtpaJTZVlXu0c5vqBCcvFk0B
	 pf3BNvG3dEG5/vEObzoFZOrVMG9Eu6vhmHmhW1qhqDIVE0r2etq6ngRdiGQbX4c2LFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794047749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:In-Reply-To:References:Date:Message-ID;
	bh=L3MvNx7L4uS1ua/4VlVJq53D1lCESEMCjmMb+FYqkyE=;
	b=E9Xoeu8E4UwbEF5EqfhO2PlhLaSSFVoNOHxraZR8/0pIP8c1Qt8ayMrfdhzfrJpwk6cv
	 6oqCU2S4/kgWA+8TyS1aLLTG8N4+aVcliKQrK3WC1Ay5otqXFkOItHOrCkY/gwTbtYWS8
	 tFX8k9BToLcOBC+8U5DYCXcEurt284/t8gJRfXXiPvaBoPeAhb9X877S0QH6LYkdSgHpX
	 uxGeJO3NG4j2viZLMQ5gd/jot30wM9P09496fLdLcWK+zfEaafA1m+DEBk8SVALQMuptI
	 WOp1q5VFw/2gZnvBKrR5pvPmA16ttYH9/uMJrHGAQzY+cUkBTCLfHqA4Jl68EDRW8Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OTtek1JT;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627CE606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 627CE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OTtek1JT
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b300713befso11269987b3.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 02:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794047748; x=1794652548; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:subject:cc:to:from
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L3MvNx7L4uS1ua/4VlVJq53D1lCESEMCjmMb+FYqkyE=;
        b=OTtek1JTuN3Iyf7n9VoZp+tQgq89lMEl2qFOR1fpWaxHxEhUra1E3bkT9y/r2g43Js
         IRFLAN75g9Rsvq6DJDLKPKzQy91gK536ntp95IXryJJ2ym7BMILSaT3MTr8jO9O6Awns
         1XsunqmGUhf17Uvpa0iNN0jqwXzFIdF3dYASi1zb2Fity7fgc4sHBfgpGrOTOWtIRbm1
         EZ1FSYuYbuXTQ2QuOCZxWlJy+aoRl6qjs5jBh45qRCSrJ7nY+eZLWH+lgtM60+YSWLz0
         /8LYnN5kxiI4NbGe9lcl93jwahslOFtGnnR4P8y8B4ihvStmeUew+VdCB0KhKFXIIBTx
         FAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794047748; x=1794652548;
        h=message-id:date:references:in-reply-to:subject:cc:to:from
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L3MvNx7L4uS1ua/4VlVJq53D1lCESEMCjmMb+FYqkyE=;
        b=mm23PoLB/1EUz79Xp4R6MbJHuaKb42PBrWMwGfimFcjYpUjIou3rTPKWk/C+6E7duD
         ODr7kZVwmM3K6E75k0oalkPsXHVFUsBgH3aRwOKu4FLTkNF6wGc40jwu1AuaHfgRV/+N
         NkX2bS+SMyiiLZyV2tXCTwEqLixIH1pPblTSai/FQ1ZamLGP9N03ECza/SRw5qkRIIbI
         DS1i5UKz5SEeaDR98NC5Ul3H7XMYpOjRT7u3ahEbT8zRP0LD/uENzzbXSrdikXXdBbXT
         1hPmFGxco/fEU542J+D68zIFOyxwb4/rn+2hgVVn6zWEz26O3QpnCcAqmo8pqHZ4hEpu
         Wznw==
X-Forwarded-Encrypted: i=1; AL+hErGrOWkRnpSi7shY8TXqLr2+Rn97qBrpMps2bZDPnDR9p1xPqVrYlISGy7qk1MgONZ3PdxHq4JRpviJOwUc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6M3Y5wUEle5XqDspbl452mCzFxdCsDzDXydnC5khIvT9Il4Io
	/NBtG7DeRqbS5Um+mfpfpbD//BDRokcBviHRx7aEA5DdGn7YMcC5fPHK
X-Gm-Gg: AYBFou3RhM+iltx5acknVbalhbok7EaA7a1cq/woH8VV5a5ulYCafC3KkvNNRZHqXSh
	QdeWS98n2iL8BxkhREWR/KXpJ2pUE9lSNrKmzSEQjT6gPA7ATpjjeKiA2HIANYY6esWr9jTFSsT
	Y7hXsSIRFpWUW29QD5JjhGq+6U5cwaLxQWjh3v3ZKkfqbZjAkQ+ctKmLiuRlVDCmbFvCqc1rRP7
	0ACcETfuW8V69PtXETxgIHB7odLUHaR/hGJCwOlO+0fyHT7AzXVs+eLuNGrYo51V+xHAQzjtJBR
	ehLzHkFP0deojffsk2wtBxzL3qgHij6cOuFzdLU1VpSBS5lN2bsFq+mThL/mmeljLr8RTqU39IB
	q0CJCi3bnD4iQ3UrWduHTy1TkUoRkrlspT064mLH1ei2p3Mzdw325gCZTR+7ImmJFdKf88cyEuL
	i1c4MHuOya7aKiekb0CqYlbAbCm+RBqqlZzGDSDtOWqa73vakThU7e6p7Y//hbVA5cfQ9V3LRCV
	qO3vDwk11NYCLnop9q0K/Ave5zCJmUSIZD3JpvD5yEw/YfEhwExJK3CWUNKLxuroa8SyxMb6wHu
	1L4yQy2q2Ws9W9rKPu6B7qr4dVrsB/mIyxwIntc=
X-Received: by 2002:a05:690c:e209:20b0:8b1:88ad:1fce with SMTP id 00721157ae682-8b341adac42mr22322867b3.42.1794047748181;
        Sat, 07 Nov 2026 02:35:48 -0800 (PST)
Received: from [127.0.1.1] ([2804:7f0:b032:22c1:ff65:8fd4:5b62:243d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f8880d2sm38744097b3.42.2026.11.07.02.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:35:47 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Carlos Alberto <carlosalberto4ti@gmail.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: gregkh@linuxfoundation.org, mchehab@kernel.org, hverkuil@xs4all.nl, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] staging: media: facetimehd: add driver for Apple FaceTime HD camera
In-Reply-To: <CAMeQTsZAfgfBadAV28-k9jmKoqJi03xghmnAqUwK8Unzd8JEsw@mail.gmail.com>
References: <20261106204329.2176266-1-carlosalberto4ti@gmail.com> <CAMeQTsZAfgfBadAV28-k9jmKoqJi03xghmnAqUwK8Unzd8JEsw@mail.gmail.com>
Date: Sat, 07 Nov 2026 07:35:42 -0300
Message-ID: <179404774285.169490.9329436104235338936@gmail.com>

SGkgUGF0cmlrLAoKRmlyc3Qgb2YgYWxsLCBJIHNpbmNlcmVseSBhcG9sb2dpemUgZm9yIHRoZSBu
b2lzZSBhbmQgdGhlIGluY29tcGxldGUgc3VibWlzc2lvbiB0byB0aGUgbWFpbGluZyBsaXN0cy4g
QXMgdGhpcyB3YXMgbXkgdmVyeSBmaXJzdCB0aW1lIGF0dGVtcHRpbmcgYW4gdXBzdHJlYW0ga2Vy
bmVsIHN1Ym1pc3Npb24sIEkgY2xlYXJseSBsYWNrZWQgdGhlIHByb3BlciBleHBlcmllbmNlIHdp
dGggdXBzdHJlYW0gcHJvY2VzcywgY2hlY2twYXRjaCBkaXNjaXBsaW5lLCBhbmQgcGF0Y2ggc3Bs
aXR0aW5nLiBJIGFtIHNvcnJ5IGZvciBhbnkgZnJ1c3RyYXRpb24gdGhpcyBjYXVzZWQuCgpUbyBi
ZSBjb21wbGV0ZWx5IGNhbmRpZCBhbmQgdHJhbnNwYXJlbnQ6IHllcywgYW4gQUkgYXNzaXN0YW50
IHdhcyB1c2VkIGFsb25nc2lkZSBwaHlzaWNhbCBoYXJkd2FyZSB0ZXN0aW5nLiBNeSBzZXR1cCBp
cyBhIHBoeXNpY2FsIE1hY0Jvb2sgUHJvIFJldGluYSAxNSIgTWlkIDIwMTQgKE1hY0Jvb2tQcm8x
MSwyLCBCQ00xNTcwIFBDSWUgY2FtZXJhLCBQQ0kgMTRlNDoxNTcwKSBydW5uaW5nIG1vZGVybiBM
aW51eCAoVWJ1bnR1IC8ga2VybmVsIDcuMCBhbmQgNi4xMispLiBUaGUgY2FtZXJhIHdhcyBmcmVl
emluZyBjb21wbGV0ZWx5IHVuZGVyIFdheWxhbmQgLyBQaXBlV2lyZSAvIEZsYXRwYWsgZHVlIHRv
IGRlcHJlY2F0ZWQgdmIyIGNhbGxiYWNrcyBhbmQgdW5hbGlnbmVkIGluLXBhZ2UgVVNFUlBUUiBi
dWZmZXIgb2Zmc2V0cyB0aGF0IHN0YWxsZWQgdGhlIElTUCBETUEgZGVzY3JpcHRvcnMuCgpNeSBn
b2FsIHdhcyB0byBkaWcgZGVlcCBpbnRvIHRoZSBoYXJkd2FyZSwgc3R1ZHkgdGhlIE1NSU8gdHJh
Y2VzLCB1bmRlcnN0YW5kIHRoZSBTMiBJT01NVSBwYWdlIG1lY2hhbmljcywgYW5kIGdldCB0aGUg
Y2FtZXJhIGZ1bmN0aW9uaW5nIHNtb290aGx5IG9uIG15IG1hY2hpbmUuIFdoZW4gd2UgZmluYWxs
eSBzb2x2ZWQgdGhlIFVTRVJQVFIgb2Zmc2V0IHN0YWxsIGFuZCBhY2hpZXZlZCBhIHJvY2stc29s
aWQsIHJlYWwtdGltZSAzMC4wIGZwcyBpbiBQaXBlV2lyZSwgRmxhdHBhayAoQ2hlZXNlIC8gU25h
cHNob3QpLCBhbmQgbmF0aXZlIFY0TDIgd2l0aG91dCBkcm9wcGVkIGZyYW1lcywgbXkgc29sZSBp
bnRlbnQgd2FzIHRvIHNoYXJlIGFsbCB0aGVzZSBmaW5kaW5ncyB3aXRoIHNvbWVvbmUgd2hvIHBv
c3Nlc3NlcyBkZWVwIGtub3dsZWRnZSBvZiB0aGUgZHJpdmVyICh5b3UpLCBzbyB5b3UgY291bGQg
cmV2aWV3LCB2YWxpZGF0ZSwgYW5kIGluY29ycG9yYXRlIHdoYXRldmVyIGlzIGdlbnVpbmVseSB1
c2VmdWwuCgpCZWNhdXNlIG9mIHRoaXMsIHdlIGVuZGVkIHVwIHdpdGggdHdvIGRpc3RpbmN0IHJl
cG9zaXRvcmllcywgYW5kIEkgd2FudCB0byBzaGFyZSBib3RoIHdpdGggeW91IGFsb25nIHdpdGgg
YWxsIHJlc2VhcmNoIGRvY3VtZW50YXRpb246CgoxLiBUaGUgRHJpdmVyIFNvdXJjZSBSZXBvc2l0
b3J5IChGdWxseSBBdWRpdGVkICYgV29ya2luZyk6CiAgIC0gR2l0SHViOiBodHRwczovL2dpdGh1
Yi5jb20vcHJvZ3JhbWFuZG9zb2x1Y29lcy9mYWNldGltZWhkL3RyZWUvbGludXgtNi4xMi1jb21w
YXQKICAgLSBQUiBSZWZlcmVuY2U6IGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRqYWsvZmFjZXRpbWVo
ZC9wdWxsLzM2OAogICAtIFN0YXR1czogV2UgaGF2ZSBub3cgZnVsbHkgYXVkaXRlZCB0aGUgZHJp
dmVyIGFnYWluc3Qgc2NyaXB0cy9jaGVja3BhdGNoLnBsICgwIGVycm9ycyBhY3Jvc3MgYWxsIDE3
IHNvdXJjZSBmaWxlcyksIHJlbW92ZWQgb2Jzb2xldGUgI2lmIExJTlVYX1ZFUlNJT05fQ09ERSBi
bG9ja3MsIG5vcm1hbGl6ZWQgU1BEWCBoZWFkZXJzIHRvIGxpbmUgMSwgZml4ZWQgQ29jY2luZWxs
ZSByZW1hcmtzLCBhbmQgbW9kZXJuaXplZCB2YjIgYnVmZmVyIHNldHVwIGFuZCBjYXBhYmlsaXRp
ZXMgZm9yIG1vZGVybiBrZXJuZWxzLgoKMi4gVGhlIEhhcmR3YXJlIFJldmVyc2UgRW5naW5lZXJp
bmcgJiBGaXJtd2FyZSBTdHVkeSBSZXBvc2l0b3J5OgogICAtIEdpdEh1YjogaHR0cHM6Ly9naXRo
dWIuY29tL3Byb2dyYW1hbmRvc29sdWNvZXMvb3Blbi1mdGhkLWZpcm13YXJlCiAgIC0gRG9jdW1l
bnRhdGlvbjogaHR0cHM6Ly9naXRodWIuY29tL3Byb2dyYW1hbmRvc29sdWNvZXMvb3Blbi1mdGhk
LWZpcm13YXJlL3RyZWUvbWFpbi9kb2NzCiAgIC0gVGhpcyByZXBvIGNvbnRhaW5zIGFsbCBvdXIg
cmV2ZXJzZSBlbmdpbmVlcmluZyBub3RlcywgTU1JTyByZWdpc3RlciBtYXBwaW5ncywgQVJNdjcg
YXJjaGl0ZWN0dXJlIGFuYWx5c2lzLCBhbmQgSVBDIG1haWxib3ggdHJhY2luZyAoREFUQVNIRUVU
X0FORF9QUk9WRU5BTkNFX1JFUE9SVC5tZCkuCiAgIC0gUmVnYXJkaW5nIHlvdXIgb2JzZXJ2YXRp
b246IHlvdSBhcmUgMTAwJSByaWdodC4gT3BlbkZUSEQgd2FzIGFuIGV4cGxvcmF0b3J5IGNsZWFu
LXJvb20gcHJvb2Ytb2YtY29uY2VwdDsgaXQgaXMgbm90IGEgY29tcGxldGUgSVNQIHBpcGVsaW5l
LiBJIGNvbXBsZXRlbHkgYWdyZWUgd2l0aCB5b3VyIHBvaW50IHRoYXQgdGhlIGVzdGFibGlzaGVk
IGV4dHJhY3QtZmlybXdhcmUuc2ggc2NyaXB0IGlzIGFscmVhZHkgdGhlIGNvcnJlY3QgYW5kIHBy
b3ZlbiBzb2x1dGlvbiBmb3IgdGhlIGNvbW11bml0eS4KCkkgd2lsbCBub3Qgc2VuZCBhbnkgZnVy
dGhlciBwYXRjaCBzZXJpZXMgdG8gdGhlIGtlcm5lbCBtYWlsaW5nIGxpc3RzLiBJIGRlZmVyIGVu
dGlyZWx5IHRvIHlvdXIgbGVhZGVyc2hpcCB0byBvcmdhbml6ZSBhbmQgc3VibWl0IHRoaXMgZHJp
dmVyIHVwc3RyZWFtIHdoZW4geW91IGZlZWwgdGhlIHF1ZXVlIG9uIEdpdEh1YiBpcyByZWFkeS4g
UGxlYXNlIGZlZWwgZnJlZSB0byBjaGVycnktcGljaywgYWRhcHQsIG9yIHJld3JpdGUgYW55IHBh
cnRzIG9mIHRoZSBjb2RlIGFuZCBkb2N1bWVudGF0aW9uIGZyb20gb3VyIHJlcG9zaXRvcmllcy4K
Ck1vc3QgaW1wb3J0YW50bHksIEkgaGF2ZSB0aGlzIHBoeXNpY2FsIE1hY0Jvb2sgUHJvIDExLDIg
b24gbXkgZGVzayBhbmQgdXNlIGl0IGRhaWx5LiBJIGFtIDEwMCUgYXQgeW91ciBzZXJ2aWNlIHdo
ZW5ldmVyIHlvdSBuZWVkIHNvbWVvbmUgdG8gdGVzdCBwYXRjaGVzLCBkdW1wIGhhcmR3YXJlIHJl
Z2lzdGVycywgb3IgdmFsaWRhdGUgYW55IGV4cGVyaW1lbnRhbCBicmFuY2ggb24gcmVhbCBoYXJk
d2FyZS4gSnVzdCByZWFjaCBvdXQgYW55dGltZSEKClRoYW5rIHlvdSBhZ2FpbiBmb3IgYWxsIHlv
dXIgZGVkaWNhdGlvbiBhbmQgZm91bmRhdGlvbmFsIHdvcmsgb24gdGhpcyBkcml2ZXIuCgpCZXN0
IHJlZ2FyZHMsCkNhcmxvcyBBbGJlcnRvCg==
