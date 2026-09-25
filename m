Received: from mail-vs2-f39.google.com (mail-vs2-f39.google.com [74.125.227.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0734C3A2E12
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790342351; cv=pass; b=qxIuYRxPHhvjSZhPvc3yz21YHuTdBggsKppSVV2Vwd8o7gw9l5J63Hsk4YgTklbKgIzZbXKkcdEKu5npcOsR2QqYarrV0kjlBTlZJE6fmXC2ZR+FewNljVU2pLrT7p9gXyy3xFeS00k5NkzVEHVMlJj18s77y5TN8MO2tO6HaZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790342351; c=relaxed/simple;
	bh=21ZA9EoUtuFvopDyFj07f0gJZGB1LAlA6aVAxrFxisk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uwCbTnxOgGyj8hsXRbsYD9m4rxCYjKQmEsiRXsd4YqzPPCBNZxD5sZaQUUMmcfQgJ/6BD5lMZBeoT9EAS1I1Q5A/L2FsnSZRxhmCRYLWcRGFfCY+80rdmoJ6JJWHjKiIglrZWr2yECVbPzpE4l40Ej8Sj4d+mPmbKW8fbLIQKLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oy7T+izl; arc=pass smtp.client-ip=74.125.227.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oy7T+izl"
Received: by mail-vs2-f39.google.com with SMTP id 71dfb90a1353d-5cc8d9ac3d7so21004e0c.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 06:19:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790342345; cv=none;
        d=google.com; s=arc-20260327;
        b=Gmv8/fL6imrfbhiAsXieqRUYH+hBIdOYh7RjE/LbpFnGYPqeTD0iig8cVPHtpfw0Jk
         nFGqJRzuCp55LJbwCyd9CQIHvz7GuWx/JF6OcpyYzXVQBqVcKT3coWhIDQG87l1mUCol
         qDRcWIvnyAb6aKe1P14YMGZo99LwZ4smb7rNqmyP0eLxoaeiItinAB7BQ7Oi6Q6bc0kp
         Z06m4Ha4kJrKCSfzkRzAqyr1AEgyKTiExXhFir4ot3erVBkAyejmfMX6jjasMomuJwFB
         6w0YX9adZqgY3VNr41SFJxxt7eKBW76dYSvOLm5zZUVYY9BufeC8a6KPrOKhuwKh5Wip
         VL6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=v1T+887+ysRm648rHil2WXYMHOnrtYykJIIR4VYBxQ8=;
        fh=zKxQDcaaYXeAJZX7Hfb8Ixfig6m+Ou7GU79p2u0siPA=;
        b=DRyEDaFmebN5kY+QAYZ45VZ2THPuTgiipAWqL/fFq5kYHTUU/PU7pU5jCQx9Mv13Fs
         6RNzq3/swAVfBgzizz9e6BWNineY3/Dt+flKIsZ3wajX9R29STUw31I4g9HUO0tWoxR0
         hmTbt9Zs0lTwlGim+uoV2lfFfd6nzR7AvzKqJaQ9jHQtPw9yDndi8XQTU9lhqf3bzywZ
         dtxbhzz/cqD1BmIgM7P15seNTbUgZ4CwZdRhTcazVb/7CBUMe9uhJAJUwICWom2uSmVX
         P1gea+0BhUd/DsHpGdoj/58u5VEKC1MPpDik0/s5HyGeR7dMYAEeRUHEc6bMskQ7Urbj
         41Vg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790342345; x=1790947145; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v1T+887+ysRm648rHil2WXYMHOnrtYykJIIR4VYBxQ8=;
        b=oy7T+izlTOvhBnLU1wKtIAUgNxL7SrYjcYOLaBb9nN1V1VN9fGyDY55FkfIcG4X45v
         mBUydNHI7syqkqDk4fcq+/rmQ2eH43KdzF+7ZknAjtzzRZxwSZedOo73+fE12p8vVwaE
         v7jhEdtJhg3Hgmxgtg7+7D8BnHvHycxeo5jsHBOhKuqZuEO7JxSUDX5ksNywszBEdgHu
         ocE9T2txgwPB1Cv215nXecWuq6mziCjEzc3z952M8kYo/mutNtCx8CLwPbS+cS62Ptoo
         xyX2HCuXBfyzKXRMvjiH4kkeOpgA2xrara3zJAaSXpirtQLG6riBCrOBGJLr96qULlY/
         OEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790342345; x=1790947145;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v1T+887+ysRm648rHil2WXYMHOnrtYykJIIR4VYBxQ8=;
        b=YE8hFtvPaIdv6rrlQunTZyfH43CrbNtULqR1yOdVhyVrwrvHCQ6KUxuE8lOam0Os8l
         mZ2GLeFBmupNR38n+epbbxz5Cp6nTC5jsR6QYcLNvysJIHs13GLYuFwwsPp+yZE39PpK
         V0/tzZH/o9nrCoLmsgUzhTE243wsaaDR39vci8fh2qXWM9SUEQZV0VxSgRjLPx5Bc0s1
         /6tDxsAGJ1hRbeDuPgQsMqgebUGJiRNt5ITejoEQWklaYlCFnP93bX0d+7D0WRPRuB5y
         cX3LAsepbLdUBMJrXxwFvy/REJlCdQntLhclKnsrK3TV2xfWVAPVpn64NeaNUBdOgfVn
         hXhA==
X-Forwarded-Encrypted: i=1; AKwUvBwH/H+SSbym3cqGlCEDhSxqLjz2CGWzyHrERFlGb097UO69iUnABoUW/1oCZzUaydEb6jDuKW8qv0ua1Z4=@vger.kernel.org
X-Gm-Message-State: AFuF++nIcuvHPqpWU6/t3L9AiWUzZmRBGzznwX9clTdJQpUCm8KAP5Te
	ytY/H/Zxw5S5tHAhOVRaRRYNVdAEJg4X9dMANbt42glwY6tjWld58jg85HTcEFM1/CtauRGEglP
	UNpyE/CGiRbMkyYMqhXmJRHBIyBtOH5k=
X-Gm-Gg: AYBFou2xkQAE7R1xP9zkwH0wPF73M7TY2FGOarZIzfH4o2O95uqAiWwxY7Q5uWkeqSP
	hC0XowHsjwR7a1dzZsc1ACajY8K1RaajM9fUcJvPeo1gbLEwpwzGk817sKnnM3Bc93nue8pjiP3
	p5SxQ4Oavh5iRePCBTvrBhBAVqZLgqWXMli5po59rL+bZv/roZCYFxlgkdkt2EojOcLvNsNvMP3
	f8+hG3z43VKrPSoNcOnJeoTgLLy+grhKhxx+Zcxr8Sm6iaGyS9Pubjq7HzQhwmm2fGdXEeMXwfi
	wiE2OJhcPAEXdPgJePtViZ6NPlDr9IApJh36B+HdaQmDvVzDLtj5wvgLBqRN5jJhNv/3fp65iM0
	2JTbTYdjaUNKF16k9ycHJy51MNhzE6yt1TI2FEs+umA==
X-Received: by 2002:a05:6122:2911:b0:5c9:e558:53da with SMTP id
 71dfb90a1353d-5cc4ac05f70mr1019989e0c.3.1790342345253; Fri, 25 Sep 2026
 06:19:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925072444.18982-1-ayhancicek@gmail.com>
In-Reply-To: <20260925072444.18982-1-ayhancicek@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 25 Sep 2026 09:18:43 -0400
X-Gm-Features: AclHuK8CdVe5loQJtszbEolTxrSAmN7yAW4OJnGnOhsKcaA4SE9RM2C-7EHSPEw
Message-ID: <CADnq5_PWzO-UqBJgduTy-X7bYnxSJyBZxL0TcsBue3S9cWyTUw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: extend MacBook VRAM-at-0 workaround to VERDE
To: =?UTF-8?B?QXloYW4gw4dpw6dlaw==?= <ayhancicek@gmail.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, airlied@gmail.com, simona@ffwll.ch
Content-Type: multipart/mixed; boundary="0000000000008403f5065c4e8ffd"

--0000000000008403f5065c4e8ffd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 3:46=E2=80=AFAM Ayhan =C3=87i=C3=A7ek <ayhancicek@g=
mail.com> wrote:
>
> The existing MacBook workaround reserves VRAM at address 0 for
> Polaris ASICs when the iGPU is enabled. This prevents cursor
> allocations from landing at address 0.
>
> A MacBookPro11,5 with Radeon R9 M370X (VERDE) hits the same
> failure mode. Hardware cursor updates repeatedly log
> "DC: Cursor address is 0!" followed by
> "DC failed to set cursor attributes".
>
> Extend the existing workaround to CHIP_VERDE. With this change,
> hardware cursor operation is stable, the cursor errors remain at
> zero during repeated cursor movement, and cursor disappearance
> and flicker are no longer observed.

Sounds like this may be consistent for most or all Macs.  How about
something like the attached patch?

Alex

>
> Signed-off-by: Ayhan =C3=87i=C3=A7ek <ayhancicek@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gmc.c
> index 1bf2a42fa..9e7f9cc2b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> @@ -1086,6 +1086,7 @@ void amdgpu_gmc_init_vga_resv_regions(struct amdgpu=
_device *adev)
>         case CHIP_RENOIR:
>                 adev->mman.keep_stolen_vga_memory =3D true;
>                 break;
> +       case CHIP_VERDE:
>         case CHIP_POLARIS10:
>         case CHIP_POLARIS11:
>         case CHIP_POLARIS12:
> --
> 2.55.0
>

--0000000000008403f5065c4e8ffd
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-drm-amdgpu-make-Mac-FB-workaround-generic.patch"
Content-Disposition: attachment; 
	filename="0001-drm-amdgpu-make-Mac-FB-workaround-generic.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mugzl7210>
X-Attachment-Id: f_mugzl7210

RnJvbSBhOTIzODRiNzdhZjM4MTgzMTBiNDcxYzllZjA0ODRhMWE2NGU4MTY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkRhdGU6IEZyaSwgMjUgU2VwIDIwMjYgMDk6MTY6MjYgLTA0MDAKU3ViamVjdDogW1BBVENI
XSBkcm0vYW1kZ3B1OiBtYWtlIE1hYyBGQiB3b3JrYXJvdW5kIGdlbmVyaWMKClJhdGhlciB0aGFu
IGFkZGluZyBhIGNhc2Ugb2YgZXZlcnkgY2hpcCB3aGVyZSB0aGlzIGlzIHNlZW4KanVzdCBjaGVj
ayBpZiB0aGUgRkIgaXMgYXQgMCBhbmQgdGhlIHNzaWQgaXMgYXBwbGUuICBUaGlzCnNob3VsZCBj
b3ZlciBhbGwgY2hpcHMgd2hpY2ggZmFsbCBpbnRvIHRoaXMgY2FzZS4KClNpZ25lZC1vZmYtYnk6
IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmMgfCAxNyArKysrKysrLS0tLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5jCmluZGV4IDFiZjJhNDJmYTYzY2UuLjkyYjMyMjE1
OTBmYjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmMKQEAgLTEwODYs
MjAgKzEwODYsMTcgQEAgdm9pZCBhbWRncHVfZ21jX2luaXRfdmdhX3Jlc3ZfcmVnaW9ucyhzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAljYXNlIENISVBfUkVOT0lSOgogCQlhZGV2LT5tbWFu
LmtlZXBfc3RvbGVuX3ZnYV9tZW1vcnkgPSB0cnVlOwogCQlicmVhazsKLQljYXNlIENISVBfUE9M
QVJJUzEwOgotCWNhc2UgQ0hJUF9QT0xBUklTMTE6Ci0JY2FzZSBDSElQX1BPTEFSSVMxMjoKLQkJ
LyogTWFjQm9va1Byb3Mgd2l0aCBzd2l0Y2hhYmxlIGdyYXBoaWNzIHB1dCBWUkFNIGF0IDAgd2hl
bgotCQkgKiB0aGUgaUdQVSBpcyBlbmFibGVkIHdoaWNoIHJlc3VsdHMgaW4gY3Vyc29yIGlzc3Vl
cyBpZgotCQkgKiB0aGUgY3Vyc29yIGVuZHMgdXAgYXQgMC4gIFJlc2VydmUgdnJhbSBhdCAwIGlu
IHRoYXQgY2FzZS4KLQkJICovCi0JCWlmIChhZGV2LT5nbWMudnJhbV9zdGFydCA9PSAwKQotCQkJ
YWRldi0+bW1hbi5rZWVwX3N0b2xlbl92Z2FfbWVtb3J5ID0gdHJ1ZTsKLQkJYnJlYWs7CiAJZGVm
YXVsdDoKIAkJYWRldi0+bW1hbi5rZWVwX3N0b2xlbl92Z2FfbWVtb3J5ID0gZmFsc2U7CiAJCWJy
ZWFrOwogCX0KKwkvKiBNYWNCb29rUHJvcyB3aXRoIHN3aXRjaGFibGUgZ3JhcGhpY3MgcHV0IFZS
QU0gYXQgMCB3aGVuCisJICogdGhlIGlHUFUgaXMgZW5hYmxlZCB3aGljaCByZXN1bHRzIGluIGN1
cnNvciBpc3N1ZXMgaWYKKwkgKiB0aGUgY3Vyc29yIGVuZHMgdXAgYXQgMC4gIFJlc2VydmUgdnJh
bSBhdCAwIGluIHRoYXQgY2FzZS4KKwkgKi8KKwlpZiAoKGFkZXYtPnBkZXYtPnN1YnN5c3RlbV92
ZW5kb3IgPT0gUENJX1ZFTkRPUl9JRF9BUFBMRSkgJiYKKwkgICAgKGFkZXYtPmdtYy52cmFtX3N0
YXJ0ID09IDApKQorCQlhZGV2LT5tbWFuLmtlZXBfc3RvbGVuX3ZnYV9tZW1vcnkgPSB0cnVlOwog
CiAJaWYgKGFtZGdwdV9zcmlvdl92ZihhZGV2KSB8fAogCSAgICAhYW1kZ3B1X2RldmljZV9oYXNf
ZGlzcGxheV9oYXJkd2FyZShhZGV2KSkgewotLSAKMi41NS4wCgo=
--0000000000008403f5065c4e8ffd--
