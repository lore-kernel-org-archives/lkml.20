Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793266929;
	b=3132wxNg7M+YL0oAFAGf+lPt489h7nEFRBQ2rPHOg/ER28w5ZS5VgLFsydDpYxPqygMf
	 XicHsKHhrYGa0VcIF0EMX+ktFAkt/xZ611dznDQw/jhEMcok4geeHu2Kq1A06R86DEoec
	 zF7Tw8EZBSzXyVET8uWu5877Nbk8L9Zo6NRYYXhtOvBPD9aOJhvpWmW3+zAIIsntQHNTm
	 VCEwvrQHPB2lx6xGGx3RIWdRqZ4LR/xGbgyVBzMRmDu6JA2CGnDPij0tViMnoKiJv/Yid
	 vb39n1KPs1kzriMN2RlIWUgW6wNLhL+CMkZmC95Mjew6CQSUgrH/9Me4ZkICbfwNIjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/qtrtCCt8ajLlat3Ue7vXo1YFqTDCb02aV3VEF/yq9o=;
	b=evBPvhw5+hy2p8cu8EnjehDOJCGEwlqtCqDwIZ+a5SvKrbncfB7kkEurzh4200nL6ZTX
	 CF1QmH+5uf3rOAUDhsRgbyoh/2/2mSTN0fOcuiPoTdJZEh/s7oNvZlXzFkkhF8Ca8PMQT
	 JJhPKa73G32jSxssNS+1BqhBunS6ZF/bA9ORlBJdvi2Squeq7FEeDYxhaxgx+CIRrP1g1
	 +KPN3olJGdz00lU8vPxUq65ibYkE3a9o6MqNEn9985FpEA9niVWw1Us89n+Kvt5rsWa0N
	 8s63iLTsQWneiXlfmBah7Z8w+kvN69HaSZuf2TvkPfk/TxN3DWC17RZyERPEOaLSu3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FeJiEnSB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEAA606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AEAA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FeJiEnSB
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso1386545a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:42:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793266929; cv=none;
        d=google.com; s=arc-20260327;
        b=Cfh9rgGsNiNc1U8dtDt41/4w7H/WgMuRqbyPfaoKr3u2+aihyWkylRNXHuU4E1Csqj
         FkzimC1hRyTSQXmcdLHJn1G7GkeutQifUBSroEDo21GZp+4HuIxnL18mXIBHJwG9I8as
         C0hB7HvtWCANed1zpYX9VSVCj4vA9TciK9l8lLNsXcO1DsauOcAwd7qQXd1KXnGBQQ+d
         mL/SZ+8Vx3EfefWwmPm448yxsJ+yGpEvQVJERXfH/kJGqNw9DEWgLtRvsPeXH5tpaBfw
         raI5wfTmF0LUmY+Fkt3+nSf5Tu7gwEP6gjPhpGK8ROAJOCTH4i2C83Fs9RWwhW0rijKs
         SlBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/qtrtCCt8ajLlat3Ue7vXo1YFqTDCb02aV3VEF/yq9o=;
        fh=Zbk6h6x4gp2612DqWi0yBXMaCaftmNb1XB0UCrsyuBA=;
        b=mcO5BcqSULrJDA/R5XprZb2wV+cD9kczgc41q/ImEblDp7xDRgYX3rTLm2AHH2XJV7
         ScMGZQrsXCWMT0g6R6YG2EQPpo/yDNHSVjfdzsSuZjst/sn0BQn+UI3jAbIDs9J3Ntl9
         gxr1s/52l8O6oHYifGL8zo/0rmPNNbosZdtsqGYXaGvFfuSFlBgRtk/OLjK8YBB/Cs/q
         D+VW1/GrnMb/9P2vWnkcwWFfz1QyCC0Fvbjz3O3nqrzH3r7HyE1dWDJ1QenBRG63SjeX
         anArC+MMlzT5hkllVNeysyhOsIDSHiKHge+k/f2BW6VXXs1TounDbBxXy2+sVkbb6dG+
         RbtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793266929; x=1793871729; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/qtrtCCt8ajLlat3Ue7vXo1YFqTDCb02aV3VEF/yq9o=;
        b=FeJiEnSBGzpALeBQoSCXqrXVeGtHIqHQm1RiyCDp8A5UiBotxzwPqFwSWnnc7nuNZY
         JSnGALPrRT3GQs2xMlnS5g1FTf59OsQrUCbgF72OzoqZHVHPt0YTgeEKtthiL0n6dyVC
         kwKQd6OoDGvEPHrE31nYo9VOpjaPik5vuMuYjNhLX478fl94ecZQ4RY4E1sz1e/re/fZ
         8BcDrT8xPKFoZaYoa/kXqd50Ku9O8CpmHUHK3zX3QwxuwZjE0o6mzSLVeOIaB+ZzrMPh
         GBi4kismPeZcSUvQe3dyrYgmHJnxwEX8o2E8jXTkZoNAfsNa/pN5CorJTudIasphByvQ
         hx3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266929; x=1793871729;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/qtrtCCt8ajLlat3Ue7vXo1YFqTDCb02aV3VEF/yq9o=;
        b=DW9Pjfa+AIFVhCk5hEt/DSZe7e5/z3H1GxTLhSWRGCZCafPcTIPJguF8a86188SI6g
         jJiVV1nbQFEY5zvYu9c2LiQaaWH3yF1YE5Eze9sVFKtjGrMKwqnKhel3eR4PIZI7O5hP
         wyYZVemHcVYKKZzv1Mfw7s0zQgSYRpAjfq6GulT1feuv1dOmrPxEU7OT10INgafE/HZt
         q8GNJyZZ3pkWQOMI0BltEqIUuInkjRyab2ZrxE6ZgfWluQG6zk9+iWNvQofkYN3zUktK
         aqDUWIO8YTPJpyrQ1gCHJkQ8V1e/HkjiaHwx3ocFnKR3yroe8FZBx5MbggZAGlSc2m3q
         9u9w==
X-Forwarded-Encrypted: i=1; AKwUvBwzc6STt2Hb4ZfzrdJhFiPYlIl6/1u4zl6EKn/cIRbMljdmhgQwSUvM3FvHKPhfomUDgp375KaHNl2nERQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKi0uBXH2YqcfUHG7ubuNiCUuWX/lw8DYAqsQcnMiTLh8kKOers
	DZhvpsMmpFoFEkA3qib+zTClW7Y6/rGjt/qmPlXJ2GaHaDCuDQiKw7BsAs2D6H6lVeZ2AbDQSLG
	nhvirUk8SBsCYR8yf9ZrMXVuz4GFL+nw=
X-Gm-Gg: AYBFou3ygHJNbh3gSpsp7p114DwlEE5FB8gsltOiaKeyfBIbP9sStcsMX8V15+CcvzF
	gGLTYb6lWALNhxKJkFKxa8ngDYFZGIPU1UTRkY3INptFb99WKYoIMh7oZWSyD5ucJgtW8rX+Kes
	H70GlQc0Sj8Spu7mR5CuF3Gt4bTkD5k8820LZzs3W3TzA8kPwf3iznOzvYiT1IGeTtshm+8BKcM
	FhWABnhKrtwmA4/nYel9rXFvjPzmCueJFu2b9ZlTDB7R6aihMH9JwDKij8zE3OsJKwDJNaB3eEV
	4UWBjjqRVNROOfc/0K3tlNAHm28ZYyTBmoPqcR2Z4J7ZZLZvpVIPOY4TjOeURE6TDxhrbR6/weX
	FgVnAeDPQCetZByY3DObOl9CEDYwTBZJWNqaj12qNRr4gEkkLQiHkkXOdYzsz3Wd4n80Spj9Ekn
	SiBV/NOWL8RycI+kI+3becTUM3997OeD2MFhG9R9fUZ40uoSn0yVSu
X-Received: by 2002:a17:90b:4fc1:b0:3ac:ffb8:1809 with SMTP id
 98e67ed59e1d1-3ae58155cc9mr3605890a91.39.1793266928572; Thu, 29 Oct 2026
 02:42:08 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028194046.49784-1-lefteris.koutrakis@gmail.com> <3f909a67-ffbd-49ff-a51c-e08cc15a5ec0@kernel.org>
In-Reply-To: <3f909a67-ffbd-49ff-a51c-e08cc15a5ec0@kernel.org>
From: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
Date: Thu, 29 Oct 2026 11:41:57 +0200
X-Gm-Features: AclHuK8yHJRvx79goquoGhQ3WCQBCYrasuceHrTn8B1eFtMqJ1aC_0GYMn7nf-I
Message-ID: <CAEFrfd=ksR01FaS49nPTbHQ4c6y6idPR-2EN8SkAHA_uqqXjNg@mail.gmail.com>
Subject: Re: [PATCH v6] powerpc/dts: Add Device Tree for WatchGuard Firebox
 T30 (v6)
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, maddy@linux.ibm.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mpe@ellerman.id.au, 
	npiggin@gmail.com, chleroy@kernel.org, ritesh.list@gmail.com, 
	sshegde@linux.ibm.com, sashiko-bot@kernel.org
Content-Type: multipart/mixed; boundary="00000000000043fac7065ef77ede"

--00000000000043fac7065ef77ede
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
=CE=A3=CF=85=CE=BD=CE=B7=CE=BC=CE=BC=CE=AD=CE=BD=CE=B1
10:48=E2=80=AF=CF=80.=CE=BC. (=CF=80=CF=81=CE=B9=CE=BD =CE=B1=CF=80=CF=8C 4=
8 =CE=BB=CE=B5=CF=80=CF=84=CE=AC)
=CF=80=CF=81=CE=BF=CF=82 Krzysztof

Hi Krzysztof,

Apologies for the double email. I forgot to use "Reply All" in my
previous message, so I am resending this to ensure the mailing lists
are properly included.

Thank you for your feedback and for pointing out the issues. You are
absolutely right.

My previous submission was a mistake; it was generated from within an
OpenWrt build tree instead of the upstream Linux repository, which
resulted in incorrect paths and redundant files being included. I also
missed the guidelines regarding the imperative mood and line wrapping
in the commit message.

I have now cloned the upstream torvalds/linux tree and created a clean
v2 patch. The commit message has been rewritten properly, and the
patch now only introduces the dts file in the correct
arch/powerpc/boot/dts/fsl/ path, along with the necessary Makefile and
vendor-prefixes.yaml additions.

I ran checkpatch.pl on the new patch (it reports 0 errors; the
remaining warnings are mostly about undocumented compatible strings
for older chips, which I hope are acceptable).

Please find the v2 patch attached. Let me know if any further
adjustments are needed.

Best regards,
Lefteris Koutrakis

=CE=A3=CF=84=CE=B9=CF=82 =CE=A0=CE=AD=CE=BC 29 =CE=9F=CE=BA=CF=84 2026 =CF=
=83=CF=84=CE=B9=CF=82 9:17=E2=80=AF=CF=80.=CE=BC., =CE=BF/=CE=B7 Krzysztof =
Kozlowski
<krzk@kernel.org> =CE=AD=CE=B3=CF=81=CE=B1=CF=88=CE=B5:
>
> On 28/10/2026 20:40, Lefteris Koutrakis wrote:
> > This commit adds initial device tree support for the WatchGuard Firebox=
 T30
>
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submi=
tting-patches.rst#L94
>
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/su=
bmitting-patches.rst#L597
>
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.
>
> > board and enables building firebox-t30.dtb under CONFIG_MPC85xx_RDB in
> > arch/powerpc/boot/dts/fsl/Makefile. It also documents the watchguard ve=
ndor
> > prefix in vendor-prefixes.yaml.
> >
> > Signed-off-by: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
> > ---
> >  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
> >  arch/powerpc/boot/dts/fsl/Makefile            |   1 +
> >  arch/powerpc/boot/dts/fsl/firebox-t30.dts     | 386 ++++++++++++++++++
> >  .../arch/powerpc/boot/dts/firebox-t30.dts     | 386 ++++++++++++++++++
> >  4 files changed, 775 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/vendor-prefixes.y=
aml
> >  create mode 100644 arch/powerpc/boot/dts/fsl/Makefile
> >  create mode 100644 arch/powerpc/boot/dts/fsl/firebox-t30.dts
> >  create mode 100644 target/linux/mpc85xx/files/arch/powerpc/boot/dts/fi=
rebox-t30.dts
> >
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/D=
ocumentation/devicetree/bindings/vendor-prefixes.yaml
> > new file mode 100644
> > index 0000000..c78a53f
> > --- /dev/null
>
> Not existing? You are sending some random changes to us. Please slow
> down, read the docs how to use Git and how to generate patches.
> Documentation/process (including submitting patches) will be helpful.
>
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -0,0 +1,2 @@
> > +  "watchguard,":
> > +    description: WatchGuard Technologies, Inc.
> > diff --git a/arch/powerpc/boot/dts/fsl/Makefile b/arch/powerpc/boot/dts=
/fsl/Makefile
> > new file mode 100644
> > index 0000000..60caf36
>
>
>
> Best regards,
> Krzysztof

--00000000000043fac7065ef77ede
Content-Type: application/octet-stream; 
	name="v2-0001-powerpc-dts-Add-support-for-WatchGuard-Firebox-T3.patch"
Content-Disposition: attachment; 
	filename="v2-0001-powerpc-dts-Add-support-for-WatchGuard-Firebox-T3.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mvtcpilx0>
X-Attachment-Id: f_mvtcpilx0

RnJvbSBmZmYwYTNiNTE3ZTlmMmU0ZWZkZDNlMWQ5ODE5Yzg1YjUxNDI0NTNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBMZWZ0ZXJpcyBLb3V0cmFraXMgPGxlZnRlcmlzLmtvdXRyYWtp
c0BnbWFpbC5jb20+CkRhdGU6IFRodSwgMjkgT2N0IDIwMjYgMDQ6Mzc6MjEgLTA0MDAKU3ViamVj
dDogW1BBVENIIHYyXSBwb3dlcnBjOiBkdHM6IEFkZCBzdXBwb3J0IGZvciBXYXRjaEd1YXJkIEZp
cmVib3ggVDMwCgpBZGQgaW5pdGlhbCBkZXZpY2UgdHJlZSBzdXBwb3J0IGZvciB0aGUgV2F0Y2hH
dWFyZCBGaXJlYm94IFQzMCBib2FyZC4KRW5hYmxlIGJ1aWxkaW5nIGZpcmVib3gtdDMwLmR0YiB1
bmRlciBDT05GSUdfTVBDODV4eF9SREIgaW4gdGhlCmFyY2gvcG93ZXJwYy9ib290L2R0cy9mc2wv
TWFrZWZpbGUuIERvY3VtZW50IHRoZSB3YXRjaGd1YXJkIHZlbmRvcgpwcmVmaXggaW4gdmVuZG9y
LXByZWZpeGVzLnlhbWwuCgpTaWduZWQtb2ZmLWJ5OiBMZWZ0ZXJpcyBLb3V0cmFraXMgPGxlZnRl
cmlzLmtvdXRyYWtpc0BnbWFpbC5jb20+Ci0tLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvdmVu
ZG9yLXByZWZpeGVzLnlhbWwgIHwgICAyICsKIGFyY2gvcG93ZXJwYy9ib290L2R0cy9mc2wvTWFr
ZWZpbGUgICAgICAgICAgICB8ICAgMSArCiBhcmNoL3Bvd2VycGMvYm9vdC9kdHMvZnNsL2ZpcmVi
b3gtdDMwLmR0cyAgICAgfCAzODYgKysrKysrKysrKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQs
IDM4OSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9wb3dlcnBjL2Jvb3Qv
ZHRzL2ZzbC9maXJlYm94LXQzMC5kdHMKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwKaW5kZXggNTQ3MWEwNmY5M2YxLi43
NWZlNGJjYmU1ZjkgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy92ZW5kb3ItcHJlZml4ZXMueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwKQEAgLTIwMTcsMyArMjAxNyw1IEBAIHBhdHRlcm5Q
cm9wZXJ0aWVzOgogYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCiAKIC4uLgorICAid2F0Y2hn
dWFyZCwiOgorICAgIGRlc2NyaXB0aW9uOiBXYXRjaEd1YXJkIFRlY2hub2xvZ2llcywgSW5jLgpk
aWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2Jvb3QvZHRzL2ZzbC9NYWtlZmlsZSBiL2FyY2gvcG93
ZXJwYy9ib290L2R0cy9mc2wvTWFrZWZpbGUKaW5kZXggZDJjYzhlMWYwMDdlLi44YjVkMGFjMGVi
YWQgMTAwNjQ0Ci0tLSBhL2FyY2gvcG93ZXJwYy9ib290L2R0cy9mc2wvTWFrZWZpbGUKKysrIGIv
YXJjaC9wb3dlcnBjL2Jvb3QvZHRzL2ZzbC9NYWtlZmlsZQpAQCAtNDQsMyArNDQsNCBAQCBkdGIt
JChDT05GSUdfR0VGX1NCQzMxMCkgKz0gZ2VmX3NiYzMxMC5kdGIKIGR0Yi0kKENPTkZJR19HRUZf
U0JDNjEwKSArPSBnZWZfc2JjNjEwLmR0YgogZHRiLSQoQ09ORklHX0dFRl9QUEM5QSkgKz0gZ2Vm
X3BwYzlhLmR0YgogZHRiLSQoQ09ORklHX01WTUU3MTAwKSArPSBtdm1lNzEwMC5kdGIKK2R0Yi0k
KENPTkZJR19NUEM4NXh4X1JEQikgKz0gZmlyZWJveC10MzAuZHRiCmRpZmYgLS1naXQgYS9hcmNo
L3Bvd2VycGMvYm9vdC9kdHMvZnNsL2ZpcmVib3gtdDMwLmR0cyBiL2FyY2gvcG93ZXJwYy9ib290
L2R0cy9mc2wvZmlyZWJveC10MzAuZHRzCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAw
MDAwMDAwMC4uZWM2Y2Y5MTFjNjZmCi0tLSAvZGV2L251bGwKKysrIGIvYXJjaC9wb3dlcnBjL2Jv
b3QvZHRzL2ZzbC9maXJlYm94LXQzMC5kdHMKQEAgLTAsMCArMSwzODYgQEAKKy8vIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyIE9SIE1JVAorLyoKKyAqIERldmljZSBU
cmVlIGZvciBXYXRjaEd1YXJkIEZpcmVib3ggVDMwCisgKiBBdXRob3I6IExlZnRlcmlzIEtvdXRy
YWtpcyA8bGVmdGVyaXMua291dHJha2lzQGdtYWlsLmNvbT4KKyAqLworCisjaW5jbHVkZSA8ZHQt
YmluZGluZ3MvZ3Bpby9ncGlvLmg+CisjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW5wdXQvaW5wdXQu
aD4KKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9sZWRzL2NvbW1vbi5oPgorCisvaW5jbHVkZS8gInAx
MDIwc2ktcHJlLmR0c2kiCisKKy8geworCW1vZGVsID0gIldhdGNoZ3VhcmQgRmlyZWJveCBUMzAi
OworCWNvbXBhdGlibGUgPSAid2F0Y2hndWFyZCxmaXJlYm94LXQzMCIsICJmc2wsUDEwMjBSREIi
OworCisJbWVtb3J5IHsKKwkJZGV2aWNlX3R5cGUgPSAibWVtb3J5IjsKKwl9OworCisJY3B1cyB7
CisJCS9kZWxldGUtbm9kZS8gUG93ZXJQQyxQMTAyMEAxOworCX07CisKKwlsYmM6IGxvY2FsYnVz
QGZmZTA1MDAwIHsKKwkJcmVnID0gPDAgMHhmZmUwNTAwMCAwIDB4MTAwMD47CisJCXJhbmdlcyA9
IDwweDAgMHgwIDB4MCAweGVmYzAwMDAwIDB4NDAwMDAwPjsKKworCQlub3JAMCB7CisJCQljb21w
YXRpYmxlID0gImNmaS1mbGFzaCI7CisJCQlyZWcgPSA8MHgwIDB4MCAweDQwMDAwMD47CisJCQli
YW5rLXdpZHRoID0gPDI+OworCQkJZGV2aWNlLXdpZHRoID0gPDE+OworCisJCQlwYXJ0aXRpb25z
IHsKKwkJCQljb21wYXRpYmxlID0gImZpeGVkLXBhcnRpdGlvbnMiOworCQkJCSNhZGRyZXNzLWNl
bGxzID0gPDE+OworCQkJCSNzaXplLWNlbGxzID0gPDE+OworCisJCQkJcGFydGl0aW9uQDAgewor
CQkJCQlyZWcgPSA8MHgwIDB4MjAwMDA+OworCQkJCQlsYWJlbCA9ICJub3ItY2ZnMCI7CisKKwkJ
CQkJbnZtZW0tbGF5b3V0IHsKKwkJCQkJCWNvbXBhdGlibGUgPSAiZml4ZWQtbGF5b3V0IjsKKwkJ
CQkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OworCQkJCQkJI3NpemUtY2VsbHMgPSA8MT47CisKKwkJ
CQkJCW1hY2FkZHJfbm9yX2NmZzBfMTgzMDogbWFjLWFkZHJlc3NAMTgzMCB7CisJCQkJCQkJY29t
cGF0aWJsZSA9ICJtYWMtYmFzZSI7CisJCQkJCQkJcmVnID0gPDB4MTgzMCAweDExPjsKKwkJCQkJ
CQkjbnZtZW0tY2VsbC1jZWxscyA9IDwxPjsKKwkJCQkJCX07CisKKwkJCQkJCW1hY2FkZHJfbm9y
X2NmZzBfMTg0NDogbWFjLWFkZHJlc3NAMTg0NCB7CisJCQkJCQkJY29tcGF0aWJsZSA9ICJtYWMt
YmFzZSI7CisJCQkJCQkJcmVnID0gPDB4MTg0NCAweDExPjsKKwkJCQkJCQkjbnZtZW0tY2VsbC1j
ZWxscyA9IDwxPjsKKwkJCQkJCX07CisKKwkJCQkJCW1hY2FkZHJfbm9yX2NmZzBfMTg1ODogbWFj
LWFkZHJlc3NAMTg1OCB7CisJCQkJCQkJY29tcGF0aWJsZSA9ICJtYWMtYmFzZSI7CisJCQkJCQkJ
cmVnID0gPDB4MTg1OCAweDExPjsKKwkJCQkJCQkjbnZtZW0tY2VsbC1jZWxscyA9IDwxPjsKKwkJ
CQkJCX07CisKKwkJCQkJCW1hY2FkZHJfbm9yX2NmZzBfMTg2YzogbWFjLWFkZHJlc3NAMTg2YyB7
CisJCQkJCQkJY29tcGF0aWJsZSA9ICJtYWMtYmFzZSI7CisJCQkJCQkJcmVnID0gPDB4MTg2YyAw
eDExPjsKKwkJCQkJCQkjbnZtZW0tY2VsbC1jZWxscyA9IDwxPjsKKwkJCQkJCX07CisKKwkJCQkJ
CW1hY2FkZHJfbm9yX2NmZzBfMTg4MDogbWFjLWFkZHJlc3NAMTg4MCB7CisJCQkJCQkJY29tcGF0
aWJsZSA9ICJtYWMtYmFzZSI7CisJCQkJCQkJcmVnID0gPDB4MTg4MCAweDExPjsKKwkJCQkJCQkj
bnZtZW0tY2VsbC1jZWxscyA9IDwxPjsKKwkJCQkJCX07CisKKwkJCQkJCW1hY2FkZHJfbm9yX2Nm
ZzBfMTg5NDogbWFjLWFkZHJlc3NAMTg5NCB7CisJCQkJCQkJY29tcGF0aWJsZSA9ICJtYWMtYmFz
ZSI7CisJCQkJCQkJcmVnID0gPDB4MTg5NCAweDExPjsKKwkJCQkJCQkjbnZtZW0tY2VsbC1jZWxs
cyA9IDwxPjsKKwkJCQkJCX07CisJCQkJCX07CisJCQkJfTsKKworCQkJCXBhcnRpdGlvbkAyMDAw
MCB7CisJCQkJCXJlZyA9IDwweDIwMDAwIDB4MTAwMDA+OworCQkJCQlsYWJlbCA9ICJub3ItY2Zn
MSI7CisJCQkJfTsKKworCQkJCXBhcnRpdGlvbkAzMDAwMCB7CisJCQkJCXJlZyA9IDwweDMwMDAw
IDB4MjAwMDA+OworCQkJCQlsYWJlbCA9ICJub3ItbWZnIjsKKwkJCQl9OworCisJCQkJcGFydGl0
aW9uQDUwMDAwIHsKKwkJCQkJcmVnID0gPDB4NTAwMDAgMHhjMDAwMD47CisJCQkJCWxhYmVsID0g
Im5vci1ib290b3B0IjsKKwkJCQl9OworCisJCQkJcGFydGl0aW9uQDExMDAwMCB7CisJCQkJCXJl
ZyA9IDwweDExMDAwMCAweGMwMDAwPjsKKwkJCQkJbGFiZWwgPSAibm9yLWV4dHJhMSI7CisJCQkJ
fTsKKworCQkJCXBhcnRpdGlvbkAxZDAwMDAgeworCQkJCQlyZWcgPSA8MHgxZDAwMDAgMHhjMDAw
MD47CisJCQkJCWxhYmVsID0gIm5vci1leHRyYTIiOworCQkJCX07CisKKwkJCQlwYXJ0aXRpb25A
MjkwMDAwIHsKKwkJCQkJcmVnID0gPDB4MjkwMDAwIDB4ZTAwMDA+OworCQkJCQlsYWJlbCA9ICJu
b3ItYmFja3VwIjsKKwkJCQl9OworCisJCQkJcGFydGl0aW9uQDM3MDAwMCB7CisJCQkJCXJlZyA9
IDwweDM3MDAwMCAweDEwMDAwPjsKKwkJCQkJbGFiZWwgPSAibm9yLXVib290ZW52IjsKKwkJCQl9
OworCisJCQkJcGFydGl0aW9uQDM4MDAwMCB7CisJCQkJCXJlZyA9IDwweDM4MDAwMCAweDgwMDAw
PjsKKwkJCQkJbGFiZWwgPSAibm9yLXVib290IjsKKwkJCQl9OworCQkJfTsKKwkJfTsKKwl9Owor
CisJc29jOiBzb2NAZmZlMDAwMDAgeworCQlyYW5nZXMgPSA8MHgwIDB4MCAweGZmZTAwMDAwIDB4
MTAwMDAwPjsKKworCQlncGlvMDogZ3Bpby1jb250cm9sbGVyQGZjMDAgeworCQkJI2dwaW8tY2Vs
bHMgPSA8Mj47CisJCQljb21wYXRpYmxlID0gImZzbCxwcTMtZ3BpbyI7CisJCQlyZWcgPSA8MHhm
YzAwIDB4MTAwPjsKKwkJCWludGVycnVwdHMgPSA8NDcgMHgyIDAgMD47CisJCQlncGlvLWNvbnRy
b2xsZXI7CisJCX07CisKKwkJaTJjQDMwMDAgeworCQkJcnRjQDMwIHsKKwkJCQljb21wYXRpYmxl
ID0gInNpaSxzMzUzOTBhIjsKKwkJCQlyZWcgPSA8MHgzMD47CisJCQl9OworCQl9OworCisJCWky
Y0AzMTAwIHsKKwkJCXRwbUAyOSB7CisJCQkJY29tcGF0aWJsZSA9ICJhdG1lbCxhdDk3c2MzMjA0
dCI7CisJCQkJcmVnID0gPDB4Mjk+OworCQkJfTsKKwkJfTsKKworCQlzcGkwOiBzcGlANzAwMCB7
CisJCQlmbGFzaEAwIHsKKwkJCQljb21wYXRpYmxlID0gImV2ZXJzcGluLG1yMjVoMjU2IiwgImpl
ZGVjLHNwaS1ub3IiOworCQkJCXJlZyA9IDwwPjsKKwkJCQlzcGktbWF4LWZyZXF1ZW5jeSA9IDw0
MDAwMDAwMD47CisJCQkJbTI1cCxmYXN0LXJlYWQ7CisKKwkJCQlwYXJ0aXRpb25zIHsKKwkJCQkJ
Y29tcGF0aWJsZSA9ICJmaXhlZC1wYXJ0aXRpb25zIjsKKwkJCQkJI2FkZHJlc3MtY2VsbHMgPSA8
MT47CisJCQkJCSNzaXplLWNlbGxzID0gPDE+OworCisJCQkJCXBhcnRpdGlvbkAwIHsKKwkJCQkJ
CXJlZyA9IDwweDAgMHg4MDAwPjsKKwkJCQkJCWxhYmVsID0gInNwaV9tdGRfMCI7CisJCQkJCX07
CisJCQkJfTsKKwkJCX07CisKKwkJCXNsaWNAMSB7CisJCQkJY29tcGF0aWJsZSA9ICJ6YXJsaW5r
LGxlODgyNjYiOworCQkJCXJlZyA9IDwxPjsKKwkJCQlzcGktbWF4LWZyZXF1ZW5jeSA9IDw1MDAw
MDA+OworCQkJfTsKKwkJfTsKKworCQl1c2JAMjIwMDAgeworCQkJcGh5X3R5cGUgPSAidWxwaSI7
CisJCQlkcl9tb2RlID0gImhvc3QiOworCQl9OworCisJCW1kaW9AMjQwMDAgeworCQkJc3dpdGNo
MDogc3dpdGNoQDEwIHsKKwkJCQljb21wYXRpYmxlID0gIm1hcnZlbGwsbXY4OGU2MDg1IjsKKwkJ
CQlyZWcgPSA8MHgxMD47CisKKwkJCQltZGlvIHsKKwkJCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47
CisJCQkJCSNzaXplLWNlbGxzID0gPDA+OworCisJCQkJCXN3aXRjaDBwaHkwOiBldGhlcm5ldC1w
aHlAMCB7CisJCQkJCQlyZWcgPSA8MD47CisJCQkJCX07CisKKwkJCQkJc3dpdGNoMHBoeTE6IGV0
aGVybmV0LXBoeUAxIHsKKwkJCQkJCXJlZyA9IDwxPjsKKwkJCQkJfTsKKworCQkJCQlzd2l0Y2gw
cGh5MjogZXRoZXJuZXQtcGh5QDIgeworCQkJCQkJcmVnID0gPDI+OworCQkJCQl9OworCisJCQkJ
CXN3aXRjaDBwaHkzOiBldGhlcm5ldC1waHlAMyB7CisJCQkJCQlyZWcgPSA8Mz47CisJCQkJCX07
CisKKwkJCQkJc3dpdGNoMHBoeTQ6IGV0aGVybmV0LXBoeUA0IHsKKwkJCQkJCXJlZyA9IDw0PjsK
KwkJCQkJfTsKKwkJCQl9OworCisJCQkJcG9ydHMgeworCQkJCQkjYWRkcmVzcy1jZWxscyA9IDwx
PjsKKwkJCQkJI3NpemUtY2VsbHMgPSA8MD47CisKKwkJCQkJcG9ydEAwIHsKKwkJCQkJCXJlZyA9
IDwwPjsKKwkJCQkJCWxhYmVsID0gIndhbiI7CisJCQkJCQlwaHktaGFuZGxlID0gPCZzd2l0Y2gw
cGh5MD47CisJCQkJCQludm1lbS1jZWxscyA9IDwmbWFjYWRkcl9ub3JfY2ZnMF8xODMwIDA+Owor
CQkJCQkJbnZtZW0tY2VsbC1uYW1lcyA9ICJtYWMtYWRkcmVzcyI7CisJCQkJCX07CisKKwkJCQkJ
cG9ydEAxIHsKKwkJCQkJCXJlZyA9IDwxPjsKKwkJCQkJCWxhYmVsID0gImxhbjEiOworCQkJCQkJ
cGh5LWhhbmRsZSA9IDwmc3dpdGNoMHBoeTE+OworCQkJCQkJbnZtZW0tY2VsbHMgPSA8Jm1hY2Fk
ZHJfbm9yX2NmZzBfMTg0NCAwPjsKKwkJCQkJCW52bWVtLWNlbGwtbmFtZXMgPSAibWFjLWFkZHJl
c3MiOworCQkJCQl9OworCisJCQkJCXBvcnRAMiB7CisJCQkJCQlyZWcgPSA8Mj47CisJCQkJCQls
YWJlbCA9ICJsYW4yIjsKKwkJCQkJCXBoeS1oYW5kbGUgPSA8JnN3aXRjaDBwaHkyPjsKKwkJCQkJ
CW52bWVtLWNlbGxzID0gPCZtYWNhZGRyX25vcl9jZmcwXzE4NTggMD47CisJCQkJCQludm1lbS1j
ZWxsLW5hbWVzID0gIm1hYy1hZGRyZXNzIjsKKwkJCQkJfTsKKworCQkJCQlwb3J0QDMgeworCQkJ
CQkJcmVnID0gPDM+OworCQkJCQkJbGFiZWwgPSAibGFuMyI7CisJCQkJCQlwaHktaGFuZGxlID0g
PCZzd2l0Y2gwcGh5Mz47CisJCQkJCQludm1lbS1jZWxscyA9IDwmbWFjYWRkcl9ub3JfY2ZnMF8x
ODZjIDA+OworCQkJCQkJbnZtZW0tY2VsbC1uYW1lcyA9ICJtYWMtYWRkcmVzcyI7CisJCQkJCX07
CisKKwkJCQkJcG9ydEA0IHsKKwkJCQkJCXJlZyA9IDw0PjsKKwkJCQkJCWxhYmVsID0gImxhbjQi
OworCQkJCQkJcGh5LWhhbmRsZSA9IDwmc3dpdGNoMHBoeTQ+OworCQkJCQkJbnZtZW0tY2VsbHMg
PSA8Jm1hY2FkZHJfbm9yX2NmZzBfMTg4MCAwPjsKKwkJCQkJCW52bWVtLWNlbGwtbmFtZXMgPSAi
bWFjLWFkZHJlc3MiOworCQkJCQl9OworCisJCQkJCXBvcnRANiB7CisJCQkJCQlyZWcgPSA8Nj47
CisJCQkJCQlsYWJlbCA9ICJjcHUiOworCQkJCQkJZXRoZXJuZXQgPSA8JmVuZXQwPjsKKwkJCQkJ
CXBoeS1tb2RlID0gInJnbWlpLWlkIjsKKworCQkJCQkJZml4ZWQtbGluayB7CisJCQkJCQkJc3Bl
ZWQgPSA8MTAwMD47CisJCQkJCQkJZnVsbC1kdXBsZXg7CisJCQkJCQl9OworCQkJCQl9OworCQkJ
CX07CisJCQl9OworCQl9OworCisJCW1kaW9AMjUwMDAgeworCQkJc3RhdHVzID0gImRpc2FibGVk
IjsKKwkJfTsKKworCQltZGlvQDI2MDAwIHsKKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJCX07
CisKKwkJZW5ldDA6IGV0aGVybmV0QGIwMDAwIHsKKwkJCXBoeS1jb25uZWN0aW9uLXR5cGUgPSAi
cmdtaWktaWQiOworCQkJbnZtZW0tY2VsbHMgPSA8Jm1hY2FkZHJfbm9yX2NmZzBfMTgzMCAwPjsK
KwkJCW52bWVtLWNlbGwtbmFtZXMgPSAibWFjLWFkZHJlc3MiOworCisJCQlmaXhlZC1saW5rIHsK
KwkJCQlzcGVlZCA9IDwxMDAwPjsKKwkJCQlmdWxsLWR1cGxleDsKKwkJCX07CisJCX07CisKKwkJ
ZW5ldDE6IGV0aGVybmV0QGIxMDAwIHsKKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJCX07CisK
KwkJZW5ldDI6IGV0aGVybmV0QGIyMDAwIHsKKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJCX07
CisJfTsKKworCWxlZHMgeworCQljb21wYXRpYmxlID0gImdwaW8tbGVkcyI7CisKKwkJbGVkMDog
bGVkLTAgeworCQkJZ3Bpb3MgPSA8JmdwaW8wIDIgR1BJT19BQ1RJVkVfTE9XPjsKKwkJCWNvbG9y
ID0gPExFRF9DT0xPUl9JRF9PUkFOR0U+OworCQkJZnVuY3Rpb24gPSBMRURfRlVOQ1RJT05fU1RB
VFVTOworCQl9OworCisJCWxlZDE6IGxlZC0xIHsKKwkJCWdwaW9zID0gPCZncGlvMCAzIEdQSU9f
QUNUSVZFX0xPVz47CisJCQljb2xvciA9IDxMRURfQ09MT1JfSURfUkVEPjsKKwkJCWZ1bmN0aW9u
ID0gTEVEX0ZVTkNUSU9OX1NUQVRVUzsKKwkJfTsKKworCQlsZWQyOiBsZWQtMiB7CisJCQlncGlv
cyA9IDwmZ3BpbzAgNCBHUElPX0FDVElWRV9MT1c+OworCQkJY29sb3IgPSA8TEVEX0NPTE9SX0lE
X0dSRUVOPjsKKwkJCWZ1bmN0aW9uID0gTEVEX0ZVTkNUSU9OX1VTQjsKKwkJfTsKKworCQlsZWQz
OiBsZWQtMyB7CisJCQlncGlvcyA9IDwmZ3BpbzAgNSBHUElPX0FDVElWRV9ISUdIPjsKKwkJCWNv
bG9yID0gPExFRF9DT0xPUl9JRF9HUkVFTj47CisJCQlmdW5jdGlvbiA9IExFRF9GVU5DVElPTl9X
TEFOXzVHSFo7CisJCQlkZWZhdWx0LXN0YXRlID0gImtlZXAiOworCQl9OworCisJCWxlZDQ6IGxl
ZC00IHsKKwkJCWdwaW9zID0gPCZncGlvMCA2IEdQSU9fQUNUSVZFX0hJR0g+OworCQkJY29sb3Ig
PSA8TEVEX0NPTE9SX0lEX09SQU5HRT47CisJCQlmdW5jdGlvbiA9IExFRF9GVU5DVElPTl9XTEFO
XzJHSFo7CisJCQlkZWZhdWx0LXN0YXRlID0gImtlZXAiOworCQl9OworCisJCWxlZDU6IGxlZC01
IHsKKwkJCWdwaW9zID0gPCZncGlvMCA3IEdQSU9fQUNUSVZFX0xPVz47CisJCQljb2xvciA9IDxM
RURfQ09MT1JfSURfR1JFRU4+OworCQkJZnVuY3Rpb24gPSBMRURfRlVOQ1RJT05fUE9XRVI7CisJ
CQlkZWZhdWx0LXN0YXRlID0gIm9uIjsKKwkJfTsKKwl9OworCisJcGNpMDogcGNpZUBmZmUwOTAw
MCB7CisJCXJlZyA9IDwwIDB4ZmZlMDkwMDAgMCAweDEwMDA+OworCQlyYW5nZXMgPSA8MHgyMDAw
MDAwIDB4MCAweGEwMDAwMDAwIDAgMHhhMDAwMDAwMCAweDAgMHgyMDAwMDAwMAorCQkJICAweDEw
MDAwMDAgMHgwIDB4MDAwMDAwMDAgMCAweGZmYzEwMDAwIDB4MCAweDEwMDAwPjsKKwkJc3RhdHVz
ID0gImRpc2FibGVkIjsKKworCQlwY2llQDAgeworCQkJcmFuZ2VzID0gPDB4MjAwMDAwMCAweDAg
MHhhMDAwMDAwMAorCQkJCSAgMHgyMDAwMDAwIDB4MCAweGEwMDAwMDAwCisJCQkJICAweDAgMHgy
MDAwMDAwMAorCisJCQkJICAweDEwMDAwMDAgMHgwIDB4MAorCQkJCSAgMHgxMDAwMDAwIDB4MCAw
eDAKKwkJCQkgIDB4MCAweDEwMDAwMD47CisJCX07CisJfTsKKworCXBjaTE6IHBjaWVAZmZlMGEw
MDAgeworCQlyZWcgPSA8MCAweGZmZTBhMDAwIDAgMHgxMDAwPjsKKwkJcmFuZ2VzID0gPDB4MjAw
MDAwMCAweDAgMHg4MDAwMDAwMCAwIDB4ODAwMDAwMDAgMHgwIDB4MjAwMDAwMDAKKwkJCSAgMHgx
MDAwMDAwIDB4MCAweDAwMDAwMDAwIDAgMHhmZmMwMDAwMCAweDAgMHgxMDAwMD47CisKKwkJcGNp
ZUAwIHsKKwkJCXJhbmdlcyA9IDwweDIwMDAwMDAgMHgwIDB4ODAwMDAwMDAKKwkJCQkgIDB4MjAw
MDAwMCAweDAgMHg4MDAwMDAwMAorCQkJCSAgMHgwIDB4MjAwMDAwMDAKKworCQkJCSAgMHgxMDAw
MDAwIDB4MCAweDAKKwkJCQkgIDB4MTAwMDAwMCAweDAgMHgwCisJCQkJICAweDAgMHgxMDAwMDA+
OworCisJCQlhdGgxMGs6IHdpZmlAMCwwIHsKKwkJCQlyZWcgPSA8MHgwMDAwIDAgMCAwIDA+Owor
CQkJCW52bWVtLWNlbGxzID0gPCZtYWNhZGRyX25vcl9jZmcwXzE4OTQgMD47CisJCQkJbnZtZW0t
Y2VsbC1uYW1lcyA9ICJtYWMtYWRkcmVzcyI7CisJCQl9OworCQl9OworCX07Cit9OworCisvaW5j
bHVkZS8gInAxMDIwc2ktcG9zdC5kdHNpIgotLSAKMi41My4wCgo=
--00000000000043fac7065ef77ede--
