Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1610B3803C8
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 06:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788849115; cv=pass; b=cX/hEHTm4m7K2OZektoGa5VLceS+zXwG1lo5getARVauuOsoHqIDodslVPgZbrCkfvpz0nPjCKbS713uWJPgL93qVVvZTRsgoV3nyDUsyEsoh0rUE3rPvJ/jPuECIloawVbexeG6aimJ4e2gW80SZ3rAgpZAqTtjJVEBmAj2kpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788849115; c=relaxed/simple;
	bh=K1DnQZh7RTksEY/PnpmATjYf26gyDYwEwJXUsGJdA6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QAiXAiPp9GY1Px/fMEFZ37OsEBnjaYU6iKpuF4abAnJytW/nyKh/j/UuTpmlWMuNxwlMD1w/M6jZ28zBhvMPto43NQImWrIhNt1ySmqF0UOGpdUHAejxlQHc92xxyf6/4n+hgEonE6H1JA/Zw0t5LXPRpqrvmvp2p2bID6vmOpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/oV6L8e; arc=pass smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/oV6L8e"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-782e0fc1e55so1150465137.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 23:31:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788849113; cv=none;
        d=google.com; s=arc-20260327;
        b=ls8nECzaDay7IHSt5uE3mD8jeUynJrlMusdsrN8VG3MucMfKFg5D55+ee+PXRmZ3x0
         1W+wnrpkU6JBNAs6tLQVqjikBrorHwP7pidaWgk4TIEmAwBuZ22Vn8h6yRi7DU0WaiBR
         qUVddi61MqZmy63vUdhxNdkV02t27Xwph89d3StviOJ8eLCUjryq82Zt+g2XxlSqegsF
         X2t1Re44Wgm6tK/5a0hXIXGVzWVHNOXSS3R21MOhUCKm8CSHmk2pv0eYtteA1ISXXijQ
         DEt1WNToKKgyd0bhljMAKaK/sTynMaLsIQ/1N8kdqeMzImMRN+gwihItIpKiB19dXfu0
         5RTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A0NVeeZ7CaBwnLyyfI9ekqGFl4BMkIYvBk52KFpKzqk=;
        fh=NiDTcDcyl8xlbYOqSUX7TV2/AgzvKI3NqMkogDHr9QA=;
        b=JORpU2jc5FjEuQcfysuW/aa+CS9rwzVKHAvEU8+kMlNATlD/acBAcxnCeSfA90EAGo
         AV+L1bzewKfeIlm3YUInDb+qLPrcfKBM/sA9k9BxWDt9LgnQwPaprdiToeBx6cr4aTh8
         NvUQCPmffeDxCxLdRoOIV2VIUZOxLdTkhUSvY+8HBSeSNarGnnwA6xHg9MfYfE7N21PE
         /ER0FnFoLRdaYrMO1Ye/wI2buyYzvjs4/+aQuO7fwe5v90lEgCyHsJF5DZv2xYz3GESX
         d6fzmLb0U9UPbtMQZ7pf4Kazb59r5o9/Ejf7nnk1GnxK8vwyGGxOJ6NpKuEFZFd9Vz6E
         aULg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788849113; x=1789453913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A0NVeeZ7CaBwnLyyfI9ekqGFl4BMkIYvBk52KFpKzqk=;
        b=E/oV6L8e1aiLfGoBq7YwMle5u91Ur4uTXXkB72MF4JI6VtnAYx6NITO/tu2PmL5Uf4
         +TerQDVMNv53kBymdWmftUuluJhkxtzfEWKq6zxVqMcBiIHa9xksCuoZ3nV7PUlgoEzQ
         0qmuVsm/ZlFjkwonIKMPC/m5uL+NCOMSrD+y3K62v4JIFX0UD7l8ijoZ1IiwI0ZptScS
         DqaYol1xgwnx+9eHMtOyxlDf7MMfqImxU1L9dWFhvIFgVJ/yAvjzN8P1kHy0XHYI9zKu
         9SPBUP5E6NIjDjVz3QIfjCzVS1km7LdAfHE9uOFpVDCEscvz0PuweOQyL5uKVexOjP3c
         24IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788849113; x=1789453913;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A0NVeeZ7CaBwnLyyfI9ekqGFl4BMkIYvBk52KFpKzqk=;
        b=FdzRaggf0an5jBvvbPjsqrplVlSvdII1uEqHCMU1igJh/F5+GLOoxnrZzL8rul9oDO
         AF1+lIRaU6ZqQHHz0/47axnNsoHSwvM6Fz79f/EowcaYa7YAJf/1dFQ45Gg3pQ26e9NU
         Z2Tce8Inetn5uXyTXk351RjHd2LyP+kwf21Z6kIs/q/4QbBjt9+SuQZVXOT6KjHOAgnU
         crFT+hJkaZCmXby/4E/Ys6DL2magiLI4FPeuQ40B9YDJgqv0MdAmdLVxjDrsjJ+4a2ho
         S26h+670TpAdJRUo2x8ngNfn8/8YFj2DnKqsbMJWSGInzhbqnS1CoMZkClIzCpIkTQ/F
         IzsA==
X-Forwarded-Encrypted: i=1; AKwUvBzbRYvCYD07atyu5iHeVStmyunuREPMkUpqXyNWBeduKulKnKNLwosTs9Wb84UT5Pmwnk+TLGDDSjNdTkA=@vger.kernel.org
X-Gm-Message-State: AFuF++n2fm33YKJDQ6kuZlRfMq+ogA56CQRAJfxgQLRBf6gHWhcP/UOk
	67lfk4bgeBIkW0X5lR4qkU3FVh/LdZ6t3FenzGJiN14oKR4IxqRyizlI9ziFI4V69EqDfwJuzRn
	lcBffhLVHki29vgvECY5P73eI4Ev+3xm0rA==
X-Gm-Gg: AYBFou1yYwnoqKgTafqyAsF9clfihpleA3CbgW8UQ4G52ALeq2DVHhYX73XiHzKSUMs
	bVA2CpG4htsTM+kGPGUm46jdj/Op/ZYzW0/3Oxo18yZzdhJGTeuHIHIuyXeQPRW+eLGLJEmcLak
	wrZuQrdWW+FHxkXLo/J/ZaN6Zgd1KU10CF+DtmXVb2IOFjVFodNhxc6l/3C8Abni0aaTas1/lZ4
	sST0Z5if0gX5y4eiQBQVhVkTrF2Y4mRm4Wvrmp2zeO/G/+JTvM4+QNZ01MlmmhVIZZjAyRDVY2w
	YpixWxNwpI7LqkS8H1IuvpNZ6YxUBNyXxKNMlF4AlujksGA=
X-Received: by 2002:a05:6102:e0d:b0:785:d308:cc0a with SMTP id
 ada2fe7eead31-78a4a91077bmr9190993137.9.1788849112904; Mon, 07 Sep 2026
 23:31:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-add-raa229639-and-raa229640-v1-0-8f7218cba85d@gmail.com>
 <20260907-add-raa229639-and-raa229640-v1-1-8f7218cba85d@gmail.com> <20260907-chimp-pectin-20f4ea3b772c@spud>
In-Reply-To: <20260907-chimp-pectin-20f4ea3b772c@spud>
From: Colin Huang <u8813345@gmail.com>
Date: Tue, 8 Sep 2026 14:31:40 +0800
X-Gm-Features: AcwNN1VlTv2SntxcoxVK5N-Ex2mESc274Ua-5DjlQCs8MlAthNoLCriEU_XA3R8
Message-ID: <CAPBH0A9GZSD5R657xo1woijKfgS6gecUND4uabguaqUON2exXw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: isl68137: Add Renesas
 RAA229639 and RAA229640
To: Conor Dooley <conor@kernel.org>
Cc: Colin Huang <colin.huang2@amd.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Grant Peltier <grant.peltier.jg@renesas.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=888=E6=97=A5=
=E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=881:01=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Mon, Sep 07, 2026 at 03:03:29PM +0800, Colin Huang wrote:
> > From: Colin Huang <u8813345@gmail.com>
> >
> > Add Device Tree compatible strings for Renesas RAA229639 and
> > RAA229640 PMBus devices.
>
> Driver change suggests fallback compatibles could be used.
> Why aren't they? If they can be, add them. Otherwise, explain why not in
> your commit message.
>
> pw-bot: changes-requested
>
> Thanks,
> Conor.
>
Hi Conor
  Thanks for the review.

  I didn't add a fallback compatible because I only have document for
RAA229639 and RAA229640
  and could not verify full DT level compatibility with any existing
supported devices. While both devices
  are handled by the existing raa_dmpvr2_2rail driver variant, I don't
have sufficient information to establish
  a compatible fallback relationship.

  I will clarify this in commit message in v2.

Thanks.
Colin
> >
> > Signed-off-by: Colin Huang <u8813345@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml | 2 +=
+
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl6813=
7.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> > index 8216cdf758d8..3537c7ddfb09 100644
> > --- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> > @@ -60,6 +60,8 @@ properties:
> >            - renesas,raa229001
> >            - renesas,raa229004
> >            - renesas,raa229621
> > +          - renesas,raa229639
> > +          - renesas,raa229640
> >
> >        - items:
> >            - enum:
> >
> > --
> > 2.34.1
> >
