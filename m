Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793721253;
	b=IIe4PQLR4abhgTNa7S2MKmeWRgchr6BIHxzoLA17MwTGfbycVr0Lh4ArWcCsBEY0Zusa
	 HYnjmnVM27avc+F91Ti/ayH9cdJtYEkG3abEsmR4OBWk42Tq2YJNTgJZJie0x7W7JESzj
	 bzrCezefbEAHCmJq2inmuXpQKfcxLWpWsdNSXHg8MIeCu9wr2I9Sz2PFxYzSsUqW73rfy
	 28TMwyD3ZaYRwZ6aymaDxOY5uA8RWUFSV38QS/FZ6+roz4+ZMfl7IhpvLR/LXfThRBD6K
	 tFpMJKQ4MRRGi5GTv9PJda/ZYikg5PqXvQWP29bCs9c6fcdLRbD5kwiBh2gBNH+in0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Xb8msZ+fgXjMEHN+Y/BoflVk8iRjVl0Wk5Yh+DJWfoM=;
	b=XOb+4QMiBeEx7pMf7GNVPiXfQgeEfjOWSAbPBB22fyrUhomsk4NSLsiV7Huy7tpKV0hP
	 b4LbVTv6c0ovaBtcq7YQ8b2F23YbsBMajkuW1KgrJlnCZP35CgOsCSKMImFGF+TroeVXG
	 CvNr2m67krQmJ6xwSdyHsJrPd+Kz/wGiwGUaTqA20gZxRzHjs/17gIvBVNFvtEvcR6pCa
	 ENN6FwUEP1Yg9WOh/I2DKNJIRH9/iymGk+Vg3UYgPx9JbJ7FD/NhFi+UCMRS+DOw3gp7b
	 Qv3+WEwRy3KuVQzvPoYVY/oFG1dRL6BsNITsnsWrm3n2lAJywXqN4FAPVGKOYzQLwPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jo85sCc8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216BC606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:54:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 216BC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jo85sCc8
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7cc30120465so223860137.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:54:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793721252; cv=none;
        d=google.com; s=arc-20260327;
        b=JTkHyBDbI3BJv9pDqz7aEcDzlDYEJ+Eayb4FedjBoxF1nuh288u+2+nJLiSTz6QMsi
         b18p7/uqjWU+FhtP07K20XA+ooNFZnEXW0p2LUO/sgMARmnq0lVSTdUoqzvS2sS6jRoW
         1HWxO6saFMxk/A4JeyRLL917XWjVTiGSL22+xt4+dNeOAoXkp3YTIF9QAEwaEMLT7e7l
         o2SIcQkOvlEvN9IA0/+s+tELENTUXXhTClovl9e5r8ukWs3NA/lKY/+4tZlP94Mum2H6
         g3Wx9Xu0MFJPuTHBXQuWgg4RSAfbnMVPMDdPG0X14wmSUXrxAD0BnjUMBUumYjGIv7ks
         3yQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Xb8msZ+fgXjMEHN+Y/BoflVk8iRjVl0Wk5Yh+DJWfoM=;
        fh=LHVWIq1ucO0qbEXE8hlx0uLU1cE+LbzkzsKNjEMz3EM=;
        b=buf55cdaCZNXl5+s8Cosc2Bi1S+FoZgiKQpc0nqUbytqtNLfbjpaqaf/6C58exdjCf
         zoAzKIDkWT10DhwQl3Tjgz5802EnVhSCWPMqh/iWGE580tQDRxOmtvrYvXHsc3LNaNcB
         +0GJg+00PuMkmHAavjLCleIqWGE4TGRAJIswbCBRSerKozymjTcKSL6jSkoxAOLEhEk4
         Nb60KvBaBTl3vc49yZRMMyJODqEs9DTAXEd+QmpLrlfA8mg2MVXaDHnToSPsRVsi2/k4
         EUPTDLCmPpdvb34r3Hj+QXyctdl7bz2VTzoPmP/vXoZ9o+Q/PZgDQ6EKFWdcv1pt2Goi
         pMDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793721252; x=1794326052; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xb8msZ+fgXjMEHN+Y/BoflVk8iRjVl0Wk5Yh+DJWfoM=;
        b=Jo85sCc8XdDECYSduF4DA00FMKN2TtYgnnzeTw9WCcM9vr2c/SMedMXPn5S8WnIfr2
         ubiYnZToi9MQOE9VNQQ32gXicp4mOl9f9zTS2suVCCZe/dwWe0Dej3dts0YqvTopGUu+
         kVbdkVShxGBd/YJ2A+vb5pK3/VCvr8H3+orfv22ilKR9eLNGG/YW5ZYI8ruqplGZbWJX
         gisLMEqIcs2K2YkoMkTvIstFUIFCLoijksTvdWLYTSRTYZNmsGxRu7tnuQVdp6olenj/
         ck5WX1iHfrVgNwHVGYXyFqop9xPP0CAoK/UViclPpD2TohYfLMfqPReNx9GOwCqiUBA+
         Tu+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793721252; x=1794326052;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Xb8msZ+fgXjMEHN+Y/BoflVk8iRjVl0Wk5Yh+DJWfoM=;
        b=FtpretgC/SfQfUMHSjlSP1h9aNW1vNQOZ82nRnNf9pvxdpYs0Mj5yaTszu0W6KHM1D
         WgIBFgWWxJvlt6CzfH3pBYi6Duk1OcIbz3+JCBnr/t8TLXNG7Pdhe1wE4FHWw+7ullwm
         wOmKX8tJSqJZwht/s+EmIaCT6/2CvznGXK9k230akUgHYyeslMAORFNuBKdGY2wYS2tK
         Ov6Ykg1SCJ+35j+fY/Hf73ScF8QRRfs5T+XqLDCu8Fde4DNOSttc832ICI3Zwdp1WHvQ
         YvijyA+CjWIOxHVM3wNrAtyNwqz5HU+bOM30ROZuP9YER9gKEiA1+fzz5SOXsRzu83Uf
         lO4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzmn0uFDyAh/KQog5L3QViNCHq942h1+QmgdjfqK4fCZGffxO4V3v8nut/rWC4LAjfVv72BIYSiPVJKpLw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PTu/BiQr0IzBM6mHYZGcS7vHoWJET2DViFRJEajVewcXsuEfO
	7CSf/qeE0UIhaxP7yGy9ddcnzN7JAsTMYRI7dk7iNAogbTH/6F9uYWxg8KTzZtFKqIhLWlWAuSJ
	TgNQQMjoXWpkK8aQ5O9ixVMUWUj+2ZPg=
X-Gm-Gg: AYBFou1pahzYQgsRUGpJWaRQMOQMo+9YZ+TFxE85mTV+TB9zGJPm9a34L4vpOd9rBiG
	g61sQ5iSl2ZhaFn0oKiHydWGIR+asqrWnuITR9AebR9uZkVZ66ws2se0+iDDWyUt8GggGUMo0J0
	WiMSILPDC/IxSYnT/58bhjpcv/yloguQPsJ0Kl5/H07c/wh/PaR5quUOnJf06hFXLBiUYHIgJyB
	bsEnCaS7t/OvJ5FL8yrs3V/m5da39woVZiNDt6WFPdC8muxGFtS+TQUGu7yd5eWsRxSnNfOkcSC
	e8stuD61tYI3NYLJthQ1DtegRPHESL2XhXeVKPHu8fFmtaDTGgKYyVRYWuo22U2jj2QoSKyMxCP
	GutyhZNN0roU8bzsmDHd21vthvjybW4TUKVaNdZ0c5K8gKmLgywZt+FlTvK/bN+eAgMPy5Vu/kf
	qwDLhDMzTNShrPMhvAD//MvJ8=
X-Received: by 2002:a05:6102:6484:20b0:7ca:21e4:8e20 with SMTP id
 ada2fe7eead31-7d072ba07b2mr5499484137.2.1793721252076; Tue, 03 Nov 2026
 07:54:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260916144014.879355-1-ed@aicharmers.com> <CADnq5_MsaUDm8rcxr3_0wuEAXywxziAofOO9w-dUxYS9PUoasw@mail.gmail.com>
 <20261030123000.5573e70f@kait2en-mbp15-1> <CADnq5_NCB6ur05ZvP0fe9hsgLHM0=y_Wx31G4vkpKH+F7yZ74g@mail.gmail.com>
 <20261103162512.2ec834ac@kait2en-mbp15-1>
In-Reply-To: <20261103162512.2ec834ac@kait2en-mbp15-1>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 3 Nov 2026 10:53:56 -0500
X-Gm-Features: AclHuK8XgaXraLodmmVFuSHrr-OuzfGpqPbHuNNCdg5f56R66moLICOm5O2si5g
Message-ID: <CADnq5_NDJ7V=TQLOJ37msbmhwsVG+70mPKU3ns+xmAu9jxWwcg@mail.gmail.com>
Subject: Re: [PATCH v4] drm/amd/pm: defer UCLK DPM on selected Apple Navi GPUs
To: =?UTF-8?Q?Andr=C3=A9_Eikmeyer?= <dev@deq.rocks>
Cc: Ed Schofield <ed@aicharmers.com>, amd-gfx@lists.freedesktop.org, 
	Kenneth Feng <kenneth.feng@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000000e8f73065f614643"

--0000000000000e8f73065f614643
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 10:25=E2=80=AFAM Andr=C3=A9 Eikmeyer <dev@deq.rocks>=
 wrote:
>
> On Tue, 3 Nov 2026 09:30:34 -0500
> Alex Deucher <alexdeucher@gmail.com> wrote:
>
> > It is the same issue.  I don't want two fixes for the same issue.
>
> Understandable, but it is not. Two devs told you the same
> independently.
> On another note I reviewed your patch. It only rejects empty or zero
> levels. On the 16,1 the pptable levels (736/750 MHz) are non-zero.
> Besides other issues in the code, the commit message says the exact
> patch wasn't tested, yet v5 extends it to every Apple Navi 1x.
> I am sorry but your patch is implausible to me.

I forgot to remove the pptable check.  Can you try a simplified
version of the patch?  I think all you need to do is delay the UCLK
DPM enablement until late_init.  Something like the attached patch.

Alex

--0000000000000e8f73065f614643
Content-Type: text/x-patch; charset="UTF-8"; 
	name="0001-drm-amd-pm-defer-UCLK-DPM-on-selected-Apple-Navi-GPU.patch"
Content-Disposition: attachment; 
	filename="0001-drm-amd-pm-defer-UCLK-DPM-on-selected-Apple-Navi-GPU.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mw0vas0f0>
X-Attachment-Id: f_mw0vas0f0

RnJvbSAwY2Y4YzUwMTA4NzVhMmNmMjU3NGJlMmJmYjY5MGZkODVhMGRhNzQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBdGhhcnZhIFRpd2FyaSA8YXRoYXJ2YXRpd2FyaWxpbnV4ZGV2
QGdtYWlsLmNvbT4KRGF0ZTogV2VkLCAxNiBTZXAgMjAyNiAxNDo0MDoxNCArMDAwMApTdWJqZWN0
OiBbUEFUQ0hdIGRybS9hbWQvcG06IGRlZmVyIFVDTEsgRFBNIG9uIHNlbGVjdGVkIEFwcGxlIE5h
dmkgR1BVcwpNSU1FLVZlcnNpb246IDEuMApDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJz
ZXQ9VVRGLTgKQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAoKQXBwbGUgTmF2aSBHUFVz
IGludGVybWl0dGVudGx5IHRpbWUgb3V0IGR1cmluZyBTTVUgaW5pdGlhbGl6YXRpb24Kd2hlbiBF
bmFibGVBbGxTbXVGZWF0dXJlcyBpbmNsdWRlcyBVQ0xLIERQTS4gTGVhdmUgVUNMSyBvdXQgb2Yg
dGhhdCBlYXJseQpyZXF1ZXN0IGFuZCBlbmFibGUgaXQgZnJvbSBOYXZpIHBvc3QtaW5pdCwgYWZ0
ZXIgZGlzcGxheSBoYXJkd2FyZSBpbml0CmFuZCBiZWZvcmUgdGhlIFVNQyB3b3JrYXJvdW5kIGFu
ZCBVTUQgY2xvY2sgc2V0dXAuCgpSZWFkIGJhY2sgdGhlIGVuYWJsZWQgZmVhdHVyZXMgYmVmb3Jl
IHJlYnVpbGRpbmcgdGhlIG1lbW9yeSBjbG9jayB0YWJsZQphbmQgc3VzdGFpbmFibGUgY2xvY2sg
bGltaXRzLiBBbHNvIGNoZWNrIHRoZSBQUFQgbWVtb3J5IHN0YXRlcyB1c2VkIGJ5CmRpc3BsYXkg
aW5pdGlhbGl6YXRpb24gYmVmb3JlIGxhdGUgZW5hYmxlbWVudC4gS2VlcCBtZW1vcnktdm9sdGFn
ZSBEUE0KYW5kIHJlc3BlY3QgdGhlIHVzZXIncyBtZW1vcnktRFBNIHNldHRpbmcgYW5kIHRoZSBz
ZWN1cmUgTmF2aSAxMCBleGNsdXNpb24uCgpUaGlzIGJ1aWxkcyBvbiBBdGhhcnZhIFRpd2FyaSdz
IHN1Ym1pdHRlZCAwMjE5IGRlbGF5ZWQtVUNMSyBwYXRjaAphbmQgR3VuYSdzIGRpYWdub3Npcy4g
RWQgU2Nob2ZpZWxkIG1vdmVkIHRoZSBlbmFibGUgcG9pbnQgaW50byB0aGUKTmF2aSBjYWxsYmFj
aywgYWRkZWQgc3RhdGUgdmFsaWRhdGlvbi4KSW5kZXBlbmRlbnQgdGVzdHMgb2YgdGhlIHJlbGF0
ZWQgVDIgaW1wbGVtZW50YXRpb24gc3VwcG9ydCBpbXByb3ZlZCBib290CnJlbGlhYmlsaXR5IG9u
IDAyMTkgYW5kIDAyMWE7IHRob3NlIGFyZSBub3QgdGVzdHMgb2YgdGhpcyBleGFjdCBBTUQgcGF0
Y2guCgpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbWQtZ2Z4LzIwMjYwODI0MTkwNDA5
LjE3MjQtMS1hdGhhcnZhdGl3YXJpbGludXhkZXZAZ21haWwuY29tLwpMaW5rOiBodHRwczovL2dp
dGh1Yi5jb20vdDJsaW51eC9saW51eC10Mi1wYXRjaGVzL3B1bGwvNjEjaXNzdWVjb21tZW50LTU2
Mzc5NzY0NjYKTGluazogaHR0cHM6Ly9naXRodWIuY29tL3QybGludXgvbGludXgtdDItcGF0Y2hl
cy9wdWxsLzYxI2lzc3VlY29tbWVudC01NjQ1NjUyNzUyCkNsb3NlczogaHR0cHM6Ly9naXRsYWIu
ZnJlZWRlc2t0b3Aub3JnL2RybS9hbWQvLS93b3JrX2l0ZW1zLzYwMDUKQXNzaXN0ZWQtYnk6IENv
ZGV4OkdQVC02CkNjOiBBbmRyw6kgRWlrbWV5ZXIgPGRldkBkZXEucm9ja3M+ClNpZ25lZC1vZmYt
Ynk6IEF0aGFydmEgVGl3YXJpIDxhdGhhcnZhdGl3YXJpbGludXhkZXZAZ21haWwuY29tPgpDby1k
ZXZlbG9wZWQtYnk6IEVkIFNjaG9maWVsZCA8ZWRAYWljaGFybWVycy5jb20+ClNpZ25lZC1vZmYt
Ynk6IEVkIFNjaG9maWVsZCA8ZWRAYWljaGFybWVycy5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXgg
RGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiAuLi4vZ3B1L2RybS9hbWQv
cG0vc3dzbXUvc211MTEvbmF2aTEwX3BwdC5jICAgfCA1NCArKysrKysrKysrKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG0vc3dzbXUvc211MTEvbmF2aTEwX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wbS9zd3NtdS9zbXUxMS9uYXZpMTBfcHB0LmMKaW5kZXggMmQwNTA4ODYxOWY2ZC4uNjcyZDc0
MGU3Mjg4MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9zd3NtdS9zbXUxMS9u
YXZpMTBfcHB0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9zd3NtdS9zbXUxMS9uYXZp
MTBfcHB0LmMKQEAgLTYwLDYgKzYwLDI1IEBACiAKIHN0YXRpYyBpbnQgbmF2aTEwX2luaXRfcHB0
X2xpbWl0cyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSk7CiAKK3N0YXRpYyBib29sIGlzX2FzaWNf
c2VjdXJlKHN0cnVjdCBzbXVfY29udGV4dCAqc211KTsKKworc3RhdGljIGJvb2wgbmF2aTEwX2Fw
cGxlX25lZWRzX2xhdGVfdWNsayhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKK3sKKwlzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiA9IHNtdS0+YWRldjsKKwlzdHJ1Y3QgcGNpX2RldiAqcGRldiA9
IGFkZXYtPnBkZXY7CisKKwlpZiAoIShhZGV2LT5wbS5wcF9mZWF0dXJlICYgUFBfTUNMS19EUE1f
TUFTSykpCisJCXJldHVybiBmYWxzZTsKKworCS8qIFByZXNlcnZlIHRoZSBleGlzdGluZyBzZWN1
cmUgTmF2aSAxMCBtZW1vcnktRFBNIGV4Y2x1c2lvbi4gKi8KKwlpZiAoaXNfYXNpY19zZWN1cmUo
c211KSAmJgorCSAgICBhbWRncHVfaXBfdmVyc2lvbihhZGV2LCBNUDFfSFdJUCwgMCkgPT0gSVBf
VkVSU0lPTigxMSwgMCwgMCkgJiYKKwkgICAgYWRldi0+cmV2X2lkID09IDApCisJCXJldHVybiBm
YWxzZTsKKworCXJldHVybiBwZGV2LT5zdWJzeXN0ZW1fdmVuZG9yID09IFBDSV9WRU5ET1JfSURf
QVBQTEU7Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc211X2ZlYXR1cmVfYml0cyBuYXZpMTBf
ZHBtX2ZlYXR1cmVzID0gewogCS5iaXRzID0gewogCQlTTVVfRkVBVFVSRV9CSVRfSU5JVChGRUFU
VVJFX0RQTV9QUkVGRVRDSEVSX0JJVCksCkBAIC0zNTYsNiArMzc1LDExIEBAIG5hdmkxMF9pbml0
X2FsbG93ZWRfZmVhdHVyZXMoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCiAJCXNtdV9mZWF0dXJl
X2xpc3Rfc2V0X2JpdChzbXUsIFNNVV9GRUFUVVJFX0xJU1RfQUxMT1dFRCwgRkVBVFVSRV9NRU1f
TVZERF9TQ0FMSU5HX0JJVCk7CiAJfQogCisJLyogRGVmZXIgVUNMSyBvbiB0aGUgc2VsZWN0ZWQg
QXBwbGUgYm9hcmRzIHVudGlsIElQIGxhdGUgaW5pdC4gKi8KKwlpZiAobmF2aTEwX2FwcGxlX25l
ZWRzX2xhdGVfdWNsayhzbXUpKQorCQlzbXVfZmVhdHVyZV9saXN0X2NsZWFyX2JpdChzbXUsIFNN
VV9GRUFUVVJFX0xJU1RfQUxMT1dFRCwKKwkJCQkJICAgRkVBVFVSRV9EUE1fVUNMS19CSVQpOwor
CiAJaWYgKGlzX2FzaWNfc2VjdXJlKHNtdSkgJiYKIAkgICAgKGFtZGdwdV9pcF92ZXJzaW9uKGFk
ZXYsIE1QMV9IV0lQLCAwKSA9PSBJUF9WRVJTSU9OKDExLCAwLCAwKSkgJiYKIAkgICAgKGFkZXYt
PnJldl9pZCA9PSAwKSkKQEAgLTMyMTksNiArMzI0MywzMCBAQCBzdGF0aWMgaW50IG5hdmkxMF9l
bmFibGVfbWdwdV9mYW5fYm9vc3Qoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCiAJCQkJCSAgICAg
ICBOVUxMKTsKIH0KIAorLyogSVAgbGF0ZSBpbml0IGZvbGxvd3MgZGlzcGxheSBod19pbml0OyBy
ZWZyZXNoIGNsb2NrcyBiZWZvcmUgVU1DL1VNRCBzZXR1cC4gKi8KK3N0YXRpYyBpbnQgbmF2aTEw
X2FwcGxlX2xhdGVfdWNsa19lbmFibGUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCit7CisJc3Ry
dWN0IHNtdV9mZWF0dXJlX2JpdHMgZW5hYmxlZDsKKwlpbnQgcmV0OworCisJaWYgKCFuYXZpMTBf
YXBwbGVfbmVlZHNfbGF0ZV91Y2xrKHNtdSkpCisJCXJldHVybiAwOworCisJcmV0ID0gc211X2Nt
bl9mZWF0dXJlX3NldF9lbmFibGVkKHNtdSwgU01VX0ZFQVRVUkVfRFBNX1VDTEtfQklULCB0cnVl
KTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OworCXJldCA9IHNtdV9jbW5fZ2V0X2VuYWJsZWRf
bWFzayhzbXUsICZlbmFibGVkKTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OworCWlmICghc211
X2ZlYXR1cmVfYml0c19pc19zZXQoJmVuYWJsZWQsIEZFQVRVUkVfRFBNX1VDTEtfQklUKSkKKwkJ
cmV0dXJuIC1FSU87CisKKwlzbXVfZmVhdHVyZV9saXN0X3NldF9iaXQoc211LCBTTVVfRkVBVFVS
RV9MSVNUX1NVUFBPUlRFRCwKKwkJCQkgRkVBVFVSRV9EUE1fVUNMS19CSVQpOworCisJcmV0dXJu
IDA7Cit9CisKIHN0YXRpYyBpbnQgbmF2aTEwX3Bvc3Rfc211X2luaXQoc3RydWN0IHNtdV9jb250
ZXh0ICpzbXUpCiB7CiAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBzbXUtPmFkZXY7CkBA
IC0zMjI3LDYgKzMyNzUsMTIgQEAgc3RhdGljIGludCBuYXZpMTBfcG9zdF9zbXVfaW5pdChzdHJ1
Y3Qgc211X2NvbnRleHQgKnNtdSkKIAlpZiAoYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKQogCQlyZXR1
cm4gMDsKIAorCXJldCA9IG5hdmkxMF9hcHBsZV9sYXRlX3VjbGtfZW5hYmxlKHNtdSk7CisJaWYg
KHJldCkgeworCQlkZXZfZXJyKGFkZXYtPmRldiwgIkZhaWxlZCB0byBlbmFibGUgbGF0ZSBVQ0xL
IERQTTogJWRcbiIsIHJldCk7CisJCXJldHVybiByZXQ7CisJfQorCiAJcmV0ID0gbmF2aTEwX3J1
bl91bWNfY2RyX3dvcmthcm91bmQoc211KTsKIAlpZiAocmV0KQogCQlkZXZfZXJyKGFkZXYtPmRl
diwgIkZhaWxlZCB0byBhcHBseSB1bWMgY2RyIHdvcmthcm91bmQhXG4iKTsKLS0gCjIuNTYuMAoK
--0000000000000e8f73065f614643--
