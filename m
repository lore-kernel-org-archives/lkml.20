Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990189;
	b=4pn/hBNFLOtYSzt9lubn4PpSz0PAQ1PM0YVMPhpFQzCUePdkpK+RoHOoFhd7dMjou9RS
	 xH2lQTBq2uetQ84T9lRbh40gvqbnVpHNGMZ0Y3MurD0DxU7dUD/AEpUiH1/BxlCy/uXhj
	 rQ4DwI0Iyx0XOAGKL5W/Kd6mbIMtozDk/Z3KW/wuLum7wy+Wk16r3O3/sClSV5Jc8k4k3
	 ikuqpwtys0qB02CLHHFX3snQC8HvarlWaoIFNejW9c39U1nCvrVLJLq5ydAxu7V5DmdFj
	 El8kyVdJqBSnbEbtjHngnnhwSajFFd2HN8clXO3SIt4ZqVhMbdMlbC1FMDbKOsHHNgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990189;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UliTkuKSwijkprFnPvplR6mcOQUjgocutB6yCvWNZyo=;
	b=1yCLlxxGtQcDosIEQT+lhLEi7d4dl3MPWZloD5sFATCCgX/sk0uX1G9tcjb4j6efiCne
	 xAZT/W/F1IWpK3UUgU7rMtuJR3KtNVMv7/WPvkqdIK3IvHWqkPkx572OD22lcTlrVpXn7
	 pyCqf9xyfAkXUijJ8SIThEhXO4wQ+YaqvWar7tBZu/ovW4GTVhDIJeVRp2xz4p2uCh0RU
	 OkNeLG5lzj1XX5KMANLVYfiDWOqMvVEFoddwEN5VSiyj8WcjXBoF5VbBY4jjJzGwsetHF
	 Ude2w5eB3XMT/fhGSyZPhQnn9MzTFSPJyKbXoOrl07XYmorAYMkBP2L+m9s3zITADTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.win;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9066B606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9066B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.win
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b577addee9so1146819a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:36:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990188; x=1794594988;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UliTkuKSwijkprFnPvplR6mcOQUjgocutB6yCvWNZyo=;
        b=YJue6G8wROB65p1B39U6L+ynvgE75Mxhotf4IxbdfKDfkNrFwvvApoKeKpOd8RmVLa
         PD0yy2qBzpipUvsJWEqxLYnd69EM3tGNsIciuW2HD9LLLgMA25yoYAhCJt7JQdrXRY2l
         llMfD/qw1QpQGk5x34YIqybuALCKetqq0Co+uxnyyeAptjo91d+pW5/YhDzcnubA3qH7
         ByOdEm3q29XepzaS0Hbm2QwFkDiU6aeQ/faX1tXGqCveKw9UCy88R5JxWI0birX0M1tf
         IVUWsaStIlWPUnyOaj0PySbBiCJP2hmrnkgrj/loOsxGCCk3WN9tH7veeBMcvgJmiZuV
         6nlA==
X-Forwarded-Encrypted: i=1; AL+hErERPdAk6YZUjM9d+1ZOPcJFtI66zFzm1RPyjsU0JfUy1MH+GnlgKvZPkWOm9ohv2K1QGFQRqwC9jN+KJhY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AZIdjgmNcUHB8k3r0IDjDporDxfFSfn80OlauazxXvR5Iw8Oi
	kcBmpa7jtVCXs4P0SON0LhhC9S6+DlL8wPxF+vcUm2RzFZZQhv8KfcPavJ3q2lc6Mf0=
X-Gm-Gg: AYBFou1pVyA1uJfJjiLWT84CWZrjW+kYcMGOhcIFCbS+Lox5PknD3ygr+fqnerm69Dp
	JfTmWVArVXY0pVA/RGAC+gDa2HZ3mwJWnwUvLdqWOxDWKOo2Oa6ru2C9V6TWjBs4fZzQf+/plsX
	QUgf4MzlDxqUNxexPclT9bgrETZMF3hIz+CVUDNY1p9xIVlmyqIzauKpQmSZtGPk+vN9gAZ9yHS
	ifmk4nEjcXerL6AjT87kNty0eO1+PxOSMzPn5WyCTdrrpOpmF3tjsL3TZoElDhiV3yZGb9X/Z8n
	Yum80NY9PAfp3O2WXFZRwmFfF/6pYjTO0IkvfW2cv3l5zhnUblwVERHewRz/6bvzBPTmBdn04kg
	1ErpWDiEMv96juQsUXA2DVTjJ+/kAeSfiAZnqpVRxTNii33IpO/kw6qOZ9c37KmZFxxChsKML/i
	k/orNN+Sixma9vKGPaWVouvoNzkkiNtFjWJSdtgD/SaP3GkiATV1M9rY7AwE/lL7Zl4u5rS8m4z
	HuqnSwxdlYnMV6efzhMLUA4Nrj41oBVxEDwFHIBkEVXPwtofiHLUcR2Uj0TPQHDsNWQeeCaQ6fz
	9GPOQmpwNt+/GNkg/RsEQkaD60TweHxpuMmVgnFGOivShZ8IDny91UIOJSA=
X-Received: by 2002:a05:6402:3603:b0:6b4:66c9:92c7 with SMTP id 4fb4d7f45d1cf-6b5977e0fe7mr2362990a12.24.1793990187872;
        Fri, 06 Nov 2026 10:36:27 -0800 (PST)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b669c4c08csm921293a12.37.2026.11.06.10.36.27
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 10:36:27 -0800 (PST)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4cdc606b47so141290766b.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:36:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE3uba15P6w39NCLTsMueTu/b02r+ZunI6rJtVClKhOuZFj1K3LEhQb4oL2S7k5/e4x5RQW1Vlo2j5iBNI=@vger.kernel.org
X-Received: by 2002:a17:907:ea89:b0:c4c:bff4:200c with SMTP id
 a640c23a62f3a-c4d3531f031mr283547466b.32.1793989808075; Fri, 06 Nov 2026
 10:30:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029232437.2581640-1-jarkko@kernel.org> <20261029232437.2581640-2-jarkko@kernel.org>
In-Reply-To: <20261029232437.2581640-2-jarkko@kernel.org>
From: Ignat Korchagin <ignat@linux.win>
Date: Fri, 6 Nov 2026 18:29:56 +0000
X-Gmail-Original-Message-ID: <CAOs+rJVNyJwqp4CR-d_T4GVjNMjgbaDL78_mZCVGGvN1xpd33w@mail.gmail.com>
X-Gm-Features: AclHuK8TGNjpH-aL7rdb3WJ8RwrdjoKcrJ52VddwbSIE-hld3YHoMNkMBO-NFbA
Message-ID: <CAOs+rJVNyJwqp4CR-d_T4GVjNMjgbaDL78_mZCVGGvN1xpd33w@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] KEYS: Introduce keyring_is_empty()
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org, 
	Eric Biggers <ebiggers@kernel.org>, Lukas Wunner <lukas@wunner.de>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
	Mikulas Patocka <mpatocka@redhat.com>, Benjamin Marzinski <bmarzins@redhat.com>, 
	"Theodore Y. Ts'o" <tytso@mit.edu>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, 
	"open list:ASYMMETRIC KEYS" <linux-crypto@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:DEVICE-MAPPER (LVM)" <dm-devel@lists.linux.dev>, 
	"open list:FSVERITY: READ-ONLY FILE-BASED AUTHENTICITY PRO..." <fsverity@lists.linux.dev>, 
	"open list:BPF [GENERAL] (Safe Dynamic Programs and Tools)" <bpf@vger.kernel.org>, 
	"open list:SECURITY SUBSYSTEM" <linux-security-module@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 11:25=E2=80=AFPM Jarkko Sakkinen <jarkko@kernel.org=
> wrote:
>
> Introduce keyring_is_empty() in order to decouple for BPF, dm-verity and
> fs-verity how keyring internally manages the keys.
>
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>

Reviewed-by: Ignat Korchagin <ignat@linux.win>

> ---
>  drivers/md/dm-verity-verify-sig.c                      |  2 +-
>  fs/verity/signature.c                                  |  2 +-
>  include/linux/key.h                                    |  1 +
>  kernel/bpf/keys.c                                      |  2 +-
>  security/keys/keyring.c                                | 10 ++++++++++
>  .../selftests/dm-verity/test-dm-verity-keyring.sh      |  2 +-
>  6 files changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/md/dm-verity-verify-sig.c b/drivers/md/dm-verity-ver=
ify-sig.c
> index aadcf5e4a47c..cad21e9144ed 100644
> --- a/drivers/md/dm-verity-verify-sig.c
> +++ b/drivers/md/dm-verity-verify-sig.c
> @@ -153,7 +153,7 @@ int verity_verify_root_hash(const void *root_hash, si=
ze_t root_hash_len,
>         if (ret !=3D -ENOKEY && ret !=3D -EKEYREJECTED)
>                 return ret;
>
> -       if (dm_verity_keyring->keys.nr_leaves_on_tree &&
> +       if (!keyring_is_empty(dm_verity_keyring) &&
>             dm_verity_keyring->restrict_link)
>                 ret =3D verify_pkcs7_signature(root_hash, root_hash_len,
>                                              sig_data, sig_len,
> diff --git a/fs/verity/signature.c b/fs/verity/signature.c
> index 0302a4e506ec..890d33b9d812 100644
> --- a/fs/verity/signature.c
> +++ b/fs/verity/signature.c
> @@ -67,7 +67,7 @@ int fsverity_verify_signature(const struct fsverity_inf=
o *vi,
>                 return 0;
>         }
>
> -       if (fsverity_keyring->keys.nr_leaves_on_tree =3D=3D 0) {
> +       if (keyring_is_empty(fsverity_keyring)) {
>                 /*
>                  * The ".fs-verity" keyring is empty, due to builtin sign=
atures
>                  * being supported by the kernel but not actually being u=
sed.
> diff --git a/include/linux/key.h b/include/linux/key.h
> index c4486e938a06..20ca43f5eab1 100644
> --- a/include/linux/key.h
> +++ b/include/linux/key.h
> @@ -439,6 +439,7 @@ extern int restrict_link_reject(struct key *keyring,
>                                 struct key *restriction_key);
>
>  extern int keyring_clear(struct key *keyring);
> +bool keyring_is_empty(const struct key *keyring);
>
>  extern key_ref_t keyring_search(key_ref_t keyring,
>                                 struct key_type *type,
> diff --git a/kernel/bpf/keys.c b/kernel/bpf/keys.c
> index bffc356839ac..24e0416abc99 100644
> --- a/kernel/bpf/keys.c
> +++ b/kernel/bpf/keys.c
> @@ -29,7 +29,7 @@ struct bpf_key *bpf_lookup_keyring(void)
>
>         if (!bpf_keyring)
>                 return NULL;
> -       if (!READ_ONCE(bpf_keyring->keys.nr_leaves_on_tree) ||
> +       if (keyring_is_empty(bpf_keyring) ||
>             !READ_ONCE(bpf_keyring->restrict_link))
>                 return NULL;
>
> diff --git a/security/keys/keyring.c b/security/keys/keyring.c
> index 5281da9d5bf7..ac48d6204915 100644
> --- a/security/keys/keyring.c
> +++ b/security/keys/keyring.c
> @@ -443,6 +443,16 @@ static void keyring_destroy(struct key *keyring)
>         assoc_array_destroy(&keyring->keys, &keyring_assoc_array_ops);
>  }
>
> +/**
> + * keyring_is_empty - Check whether a keyring is empty
> + * @keyring: The keyring to check.
> + */
> +bool keyring_is_empty(const struct key *keyring)
> +{
> +       return READ_ONCE(keyring->keys.nr_leaves_on_tree) =3D=3D 0;
> +}
> +EXPORT_SYMBOL(keyring_is_empty);
> +
>  /*
>   * Describe a keyring for /proc.
>   */
> diff --git a/tools/testing/selftests/dm-verity/test-dm-verity-keyring.sh =
b/tools/testing/selftests/dm-verity/test-dm-verity-keyring.sh
> index 1f9601ef22f8..792449d356cf 100755
> --- a/tools/testing/selftests/dm-verity/test-dm-verity-keyring.sh
> +++ b/tools/testing/selftests/dm-verity/test-dm-verity-keyring.sh
> @@ -746,7 +746,7 @@ test_keyring_inactive_when_empty() {
>      log_info "TEST: Verify dm-verity keyring is inactive when sealed emp=
ty"
>
>      # When keyring_unsealed=3D0, the keyring is sealed immediately while=
 empty
> -    # This means it should NOT be used for verification (nr_leaves_on_tr=
ee=3D0)
> +    # An empty keyring should NOT be used for verification.
>
>      log_info "Keyring state (should be empty and sealed):"
>      list_keyring_keys
> --
> 2.47.3
>
>
