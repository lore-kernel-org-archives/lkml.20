Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794297243;
	b=sj0hUC/oZZrjMdIM2B/OcdOgqiVv1/r4Ox+TrciHtve0xEiQTEYYIIKYUqldqlLynCJa
	 Ef7IW6/dJqZ6XnGldy2DB7n2u48Z1b94BZrwb0H8DJTbx5T3pjwyW6SvWWccbMmjXV+5x
	 outIxcvurzJJlGr0JRSaQZYnOyeqpjr90ioGwFcUIiayhc2TxGNefu2Io0PtPTvciFfs6
	 YgXBOFHcglKDSl5oKLqPKAxk2OpLSV1xnDXuaxhsX2UTuqxQyqZoFykO1Gyibf23TpBKK
	 2lkNk4Ob7rW7UIwoYGnXsuuX7pNcgFpjChhIaBAVezo9e/aTdOVhnXuBdrZ2zf6Os7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tRnQd2LIAHJZoonewpOl9i62ZvqjRvQNSGRPP0Ehga4=;
	b=gA3fzWGhJ6kqDVe0vRLrvK8Lth0yDKf7ZpLQuFKaqw0T0W4NzD8rzN+pfArR+IPYvRmf
	 4CJnpHK7RIO9UBPPYMQXri5CuvB1B3kIuSa8wgQH6JJKWfxeChegh1QuofWXYTKob/CY4
	 /DbHNV0tJStTqXzLfRYJDaCw99KYMiC16cxO2BzLbBYtyUm366GLKW66zbSYjADr7jw7N
	 K6ufAi/4nZOi6e0utkA6VKTFQIF6hz2Es2ImlrLseDPWVXVI4j/cp7eHBvQVUwnMJcwko
	 ITqx5CXfcE9WOBDX7rVScAAX7OoIVFICFlnPeuSGj2Sgr0m/AWRwbyFy+iEuHaMMYGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="KR/ttua9";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906E7606A95B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 906E7606A95B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KR/ttua9
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5ee029fd76aso410385e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:54:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794297242; cv=none;
        d=google.com; s=arc-20260327;
        b=aAymggtz/N6eMcPnlJbv7bpDFetkU+gai1QF+LPH8M+CDXYmSAEe/M+kB1ObZvAdBz
         w0pm/S/oPfZxb32UdurXZqshNKvYxsNESPIZNvDaGbKVcnRmqnGbPzmDVMhwfYMWxa2e
         VVxncSmwJuRWlyW5OerX37ILhvkzNQC8+PwmFfPUq1o33VO0eqX1/sdMUnEgcv2IXT8g
         056ky3qC3foN3o+KQqDs3qNIVZRUft8ZezBZ7JzqiW4Uo0L6k8XMcbz7aapIeXD/6A9E
         OYdWDC7HDIlwVJCFWZJPTyNw0sp5uoBB5B1TKhUt5ckC6d/tB7jJZbWZ1efmIQZzpk7F
         CP8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tRnQd2LIAHJZoonewpOl9i62ZvqjRvQNSGRPP0Ehga4=;
        fh=UldRcLzLC77UnsR+cOIVx221acOKRGdfSGPXRoGAggw=;
        b=rhn2P7EMepihFCHxbcDaiKp+pvRN/X4lA583f0zigtrGy+ilA4boMNxaefDZY+z+p5
         Jr4kn5tNd92OP1vgRAd13b3XpchJgy+HnI9cE5tRUUK9ZqZmVX3aPskMI/QUvr+iXbJg
         VtQT1ANf48RourCxWkbO8Tahbl9L+u2efdJkQ8NhcFvtQ24HpFk9vvX1o/hnacCDHeva
         1ZsYXU+0Y+UtJ1/vzg3ZtM+V1T5sUvLQJRYjpiX7OC393hPe2jvw7UmSx+HNijCZ7sKK
         fWubkq0F3dT4lXEUvm8C/tTgrp5OGR2tVwD3YsU6eNhUZAkRAw5SgmLvvcjr/6+x1ULD
         YHow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794297242; x=1794902042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tRnQd2LIAHJZoonewpOl9i62ZvqjRvQNSGRPP0Ehga4=;
        b=KR/ttua9WVVtEV31IhwACzFjT/QUSzQb7hS5bfp6Hk/be6txNbSJyewt92CZTR3zYO
         I1MUBS3/X7oQH971Iay8kcmo3nvdFu2pJ58dQ7j+VNNEwf82ukFKlAnvXDGVtP+CVktB
         qAviX+/2agEGfaya918PKr/f3DJJWKqVF0EwrsiS0RZvvonXdKoG5aJG8rZkIN0iJuek
         YOFpGxgy9m2/OmAUkJ5yxXQadkDAjiI2d9qLF7woUTR8lAjojBbUbHNFuX6Gm205/94r
         eivXLSioxNCwDZEIO09v21ifl7z448SM5FSAAyfOIplhpdiSt+9fezWO19cOpWI+fB+Z
         6jMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297242; x=1794902042;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tRnQd2LIAHJZoonewpOl9i62ZvqjRvQNSGRPP0Ehga4=;
        b=MpoQa5ojrJchVS1ELJljekPEV5msbCuOVpXA4OiaDgNKglqbLwF3dXegeY4IQaMTnx
         /JmAE8NZX9n4M79EoUP1McKVnaPN0PDrmZFMf+PtPJUUIvVicS/JK3opNXDChSgKybzp
         IzvsbJRwghKp8ekx3cpUsYETZrRyXjkvO94wjagSfJ1hHoO4PHBoY6TXpESSDF3Fsbp7
         TXDuzdOwBNNBZev+41jES2XiZAVcopv347TYzUdKY4HcEQLjyDfIFSrwfRU53fywmhO8
         nZ3iQsLmqy1cGAzl3ksb9MRG9vCQBS4Ku9JEDb8rVZcqtYk6NvT8AKEZ6LNVAiURj9ea
         hWdQ==
X-Forwarded-Encrypted: i=1; AL+hErHKSw4dwrI+n7lptWPxA9K6e1cUz/JU7+xMUigsEXWjwBvceIJUyxPoFNJogPB/uqw7j0RrD+fUuHlJfVU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JVGFG/VWaIcu3K2ieSG+93k52wMtRWNbypDxUgYJZV5HA3d+N
	HKTYF/tm9LpdulRp+7t9kv9Y89uHKhEuqp7Pa/vFNEzGLo25VrA35+6PGm0Boc6SsjjKb5pUq4f
	XQBAmTIlnjbYT2G5UVd+6AI9T20l+oWY=
X-Gm-Gg: AYBFou0CW3jTUyieIy/StV24U4LtNCXMyzJbd53z7q1/5hV3D5/CQ1tEfaA02Q0ffNV
	Lbh2YMTDZ1UGoBJmVB69d7A284OJ6POdO/9+VqpfyyglMEs/52R+MAs1TkwNVaTlYEBCwXkL3md
	7VhqizP8daMKIxteqqG/hkg+EgUdA6sCTvg7STPlOa/H9LfuMJ7m+t6+bPfPLHNDMrhf60bOfVF
	HR7EkQXAtB6FYWN+CbV/wZeKHixH3jjFQjy1neGKmBDQBH7EPiC5jMl4IKT22KjIgscMv4jITam
	6G66zBaBtEVlU80IZYci3jE12U04TRIhGf4bG1XPmWgIezB+cnOUwxJMREPIPDgPQkyG4kPLJQP
	YG59oi6mOW3mGjIUqIWg6yDuKAQ/GA2esVsFus/yLL0vlXM9BPCkqRpIxnztpqx+rYXTYNORMb2
	Qu8u1a1SqYaJZDuqU=
X-Received: by 2002:a05:6122:4902:b0:5de:ee96:75b with SMTP id
 71dfb90a1353d-5ee0d0dd877mr666952e0c.12.1794297242226; Mon, 09 Nov 2026
 23:54:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAABLQ8qdSC1r=-et0y6qnEjNE-FCvoT8wxbo6R9vmW5=bUOSgA@mail.gmail.com>
 <b7428de0-c009-45a3-a2c8-0722ed7bce6e@app.fastmail.com>
In-Reply-To: <b7428de0-c009-45a3-a2c8-0722ed7bce6e@app.fastmail.com>
From: qvkap <qvkapp@gmail.com>
Date: Tue, 10 Nov 2026 10:53:45 +0300
X-Gm-Features: AclHuK9ctTwCxK72RVhcE_CebgxLAWqeNM-n7dc1E4dE3ZDjJNTKTbGvKZcSQvw
Message-ID: <CAABLQ8qu5Wk0JpQwbSvNdQ_SWOtqHGA6HcQ_+xg013EcxxBK+A@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: add no_rfkill quirk for
 IdeaPad Slim 3 16IRH10
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Ike Panhc <ikepanhc@gmail.com>, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the feedback and clarification regarding the DCO and
submission process.

I have updated the patch to use my full real name (Ivan Vasilchenko)
in Signed-off-by, removed the external GitHub link, and prepared a
proper inline v2 patch below.

Regarding Mark's comment: I agree that modern IdeaPads/ThinkPads no
longer need ACPI rfkill and that a broader solution (or module
parameter) would be great long-term. Meanwhile, this quirk completely
resolves the erratic Wi-Fi/BT disconnects on this platform.

Please find the v2 patch below.

---
From: Ivan Vasilchenko <qvkapp@gmail.com>
Subject: [PATCH v2] platform/x86: ideapad-laptop: add no_rfkill quirk
for IdeaPad Slim 3 16IRH10

On Lenovo IdeaPad Slim 3 16IRH10 (83K2), the EC/ACPI firmware reports errat=
ic
rfkill radio states through VPCCMD_R_WIFI and VPCCMD_R_RF, causing periodic
soft/hard blocks of the native Wi-Fi/Bluetooth interfaces (iwlwifi) without
any physical switch or user interaction.

Add a no_rfkill quirk and register IdeaPad Slim 3 16IRH10 (83K2) into the
no_rfkill_dmi_table to bypass ACPI rfkill device registration and let the
native wireless driver handle radio state management.

Tested and confirmed working on live hardware.

Signed-off-by: Ivan Vasilchenko <qvkapp@gmail.com>
---
 drivers/platform/x86/ideapad-laptop.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c
b/drivers/platform/x86/ideapad-laptop.c
index 2c9e78a609d8..e393a525da5f 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -148,6 +148,7 @@ struct ideapad_private {
  } fn_keys;
  struct {
  bool set_fn_lock_led;
+ bool no_rfkill;
  } features;
  struct {
  bool initialized;
@@ -1245,6 +1246,9 @@ static int ideapad_register_rfkill(struct
ideapad_private *priv, int dev)
 {
  int ret;

+ if (priv->features.no_rfkill)
+ return 0;
+
  if (!ideapad_is_rfkill_hw_present(priv, dev))
  return -ENODEV;

@@ -1588,6 +1592,15 @@ static const struct dmi_system_id
set_fn_lock_led_list[] =3D {
  {}
 };

+static const struct dmi_system_id no_rfkill_dmi_table[] =3D {
+ {
+ .matches =3D {
+ DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+ DMI_MATCH(DMI_PRODUCT_VERSION, "IdeaPad Slim 3 16IRH10"),
+ },
+ },
+ {}
+};
+
 static void ideapad_check_features(struct ideapad_private *priv)
 {
  acpi_handle handle =3D priv->adev->handle;
@@ -1596,6 +1609,9 @@ static void ideapad_check_features(struct
ideapad_private *priv)
  if (dmi_check_system(set_fn_lock_led_list))
  priv->features.set_fn_lock_led =3D true;

+ if (dmi_check_system(no_rfkill_dmi_table))
+ priv->features.no_rfkill =3D true;
+
  if (acpi_has_method(handle, "GBMD") && acpi_has_method(handle, "SBMC"))
  priv->features.conservation_mode =3D true;


--
2.45.2

=D0=B2=D1=82, 10 =D0=BD=D0=BE=D1=8F=D0=B1. 2026=E2=80=AF=D0=B3. =D0=B2 04:0=
6, Mark Pearson <mpearson-lenovo@squebb.ca>:
>
> Hi,
>
> On Mon, Nov 9, 2026, at 12:02 PM, qvkap wrote:
> > Hi Hans, Mark, Ilpo,
> >
> > On newer IdeaPad models such as the IdeaPad Slim 3 16IRH10 (83K2), the
> > EC/ACPI firmware reports erratic rfkill radio states through
> > VPCCMD_R_WIFI / VPCCMD_R_RF, causing periodic soft/hard blocks of the
> > native Wi-Fi/Bluetooth interfaces (iwlwifi) without any user
> > interaction or physical hardware switch.
> >
> > This patch introduces a no_rfkill quirk and adds IdeaPad Slim 3
> > 16IRH10 to skip registering defective ACPI rfkill devices. Tested and
> > confirmed working on live hardware.
> >
> > GitHub: https://github.com/qvkap/ideapad-slim3-rfkill-patch
> > Raw Patch:
> > https://raw.githubusercontent.com/qvkap/ideapad-slim3-rfkill-patch/mast=
er/0001-platform-x86-ideapad-laptop-add-no_rfkill-quirk-for-.patch
> >
> > Signed-off-by: qvkap <qvkapp@gmail.com>
>
> I assume posting a link to a patch is not going to be acceptable (I almos=
t didn't bother looking at this one because of that because I'm behind on m=
y overflowing inbox) but I'll let the experienced maintainers comment on th=
at.
>
> I've been looking at a similar issue on Thinkpad's but have been trying t=
o gather data on which platforms are impacted. We're finding the same thing=
 there where the kill is powering down the device and it's never recovering=
 - and we've been fixing FW for the last 3 years to make the APCI method a =
no-op where it has caused problems. Recently the FW team complained as the =
ACPI method is used for debug testing...so trying to find a better long ter=
m solution.
>
> I'm not a fan of the DMI approach as I don't think it's going to scale we=
ll - it means every new platform is (likely) going to need to be added; whi=
ch is going to get really tedious fast.
> I don't think it's really a FW issue and more a fact that device drivers =
have caught up and the ACPI rfkill is no longer needed - but I'm guessing a=
 bit. For Thinkpad I did get confirmation that it's not used on Windows FWI=
W.
>
> I have a patch that is almost the opposite - I was going to disable the r=
fkill mechanism unless a module parameter specifically enabled it.
> My logic is maybe some older models will need it - but so far in my testi=
ng newer (5 years or less) seem fine. I've been unable to determine the cut=
-off so far.
>
> If anybody on the list has opinions let me know. Gathering data on the im=
pact is taking time (sadly in short supply)
>
> Mark
>
