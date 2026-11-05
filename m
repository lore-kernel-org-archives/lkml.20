Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793920360;
	b=v9pJbOrmolKoJGbNoWwPGS8D6X+kK/m34oUwYAHMLPairMyl0uwQZjD8QAWMXsuQ1ayx
	 zoAM5YHSeKQS6udFyxVBfXXhFNwLadIJx1MBPBZZsK/OhjIAJ+K9LiHADmak41TIXnfPu
	 hgmHTZmeyeIkKDq6OVxIvfhyljVTI2m8Sw6ueShp4hsnIP0lhqE5zqc677CxS9gMblDC9
	 CZ/fnMlQxGBC7N+EUgEqKe0oor5pqzSixFWDU0pc5YIuJowmdJeZleztJhNChWKcW7C63
	 KWNGOpSDZYRVKebRvSKXusJbDQsc8noKVntqrVVONyK78CoreA8yi2WA2WbpX9xKuBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793920360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FZlN4iHbDXpMMqj+PQLfEInqStv2KX2ANmZPpiwXjEg=;
	b=RNfbEFrZMTKiQuohtfvsWJTgmBVui+rdkFbyxx/ETkyrehoFd4oEN0lieyJk1n/8rCwZ
	 ty5B6wov+BNDiSE322Muw/+vqgMD73cbbhljxv/4DXG1exPMxZJrVGwa0+ZrbIcKyaZXY
	 enLaFdSQha5OcVoO4cOPwpRXDTuCBHH7oPrwB/BUCID4Kf3fSwp8DgFVEIo6bQT8c8gF+
	 VA+wf1OXA2ibv1+PKXticZk98WlK44hyVm+RFW93z1Y8LGsXMlHPH4gAfRp/331wOnkpj
	 cNr6zh8lrLpgKICNzf2zTHMZpz25lNy348oPJ+zWCsYz9IgS8tBxWlNC5Xqb/d6kw+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GPyWKVmX;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3D1606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:12:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D3D1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GPyWKVmX
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a3c08d6928so191020c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793920358; x=1794525158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FZlN4iHbDXpMMqj+PQLfEInqStv2KX2ANmZPpiwXjEg=;
        b=GPyWKVmXbRnHFHyAlQNZfvqo0xBU3poeqVkh6j0bhZztW1KrN3eCJPerMSo1gDtO8c
         6JpfreadEoFpRXdnLzNopzlCLOHXCQN3whZcr9fISD2NsgfstmVO1YWJrPvV3g+TutE0
         VtHd5nvVbO8rWPla6m0WZpDaMDYdRk68NSnk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793920358; x=1794525158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FZlN4iHbDXpMMqj+PQLfEInqStv2KX2ANmZPpiwXjEg=;
        b=fWq6InasSFphLkszWmtaJqB2nH/+YzRig0/xBH9dthnEWA4SexOeZBlOu31/JPkBGK
         GAJEEU0j0qR3i4qntAINyhdacOJ+gG0MZ+1nxsu5otDlFtnZhqrXe+Lu7ebX86iuZBCU
         +hw36YmNK7zdZrPn+VRruCFfXZqODvk9jVoX0hhkBlgGpEze+ma2vym2E9JzfdN++yAt
         zpK1Vg5DagPkao82M8zBB9tBe18rRvWSoo3LnDuo4WJHUClATpFTlk4fEsvmuXJywvpG
         FM+v2kSlWXl/1JuPTmM9DFW1ERk3fhwm7Qmtxd2CsMUnlbo0XYDOknCgNHCKa8wh6391
         7e+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzNWx22Rfw6fD75tJcco1JQzcoGhblTraT9kNZiyJ+vFhfejy6xVFcI4ctpoTToT7JEjZBdc2lnm2gE/Ts=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hp2N4C2XUfuJIapgJdx5nN9JKB/EmBEcbD/m/i/R5DK2axl5B
	qB1dxHO3g+pZhOpqqUfhFLwwYSRa+Na58Mh7POytQs5aEzHLwWRAPKeHk3a/+GoE6Q==
X-Gm-Gg: AYBFou3eVvMHTMIsO2Q7szprhBt61X61mkXP96kFB3NdfmDC7dSIkExJpHNBOnYaCsQ
	/IKBRtsh2mKEfvm4t2nmqaMHdZu3VShkU+Zjhq6i8A5TCSlfMY9tYm6AtDicKKrSO33dTO/PsM9
	ufirxrR1Jq9fWvuf6UiDUatsDStm7kY/tphEosvAF+d+2t6T6StNro5zPa73iDME8kUwVtM8we+
	Yf2PtiGPKoINXDEV9+kNtVCrdZ/Nx0ZQVJRJFhzocdx203iSrkY+x0F2BACkZZJbQRPhW9awyzK
	OGa2n/W7B2qBEg2H410y6oTghjrZdPd2wzjVhwxAlg6bE+ZELiYtnfgJtFjYjVgARq8erel2B76
	mTbbQFKfP1q4VKxHsoFsJkBQKdsVAtGZ92sHbGjB1lsszk+OCM4OjPsx/WAvlK4LvFDipb1eZ94
	uF+gm5sElv9y6yLx3H6CJKp2PPki182oTpZZ+CiV4+U/6P/3FlNcSy8Hw0z2kY7SEUJO3h4gFKR
	U5MY4GysIq0DS+S33zGPEe7cfAmRaTGFHjHkTt8cMAjOcy6GiA2BiCPqWMhf56nC32wphoidUV4
	3qLqqIM++yAE/n4qGioWRcELAbtWR0UMcukKX/HJdnUdck8FmUaLs3Szp1o4dpkL3BFI1SIHZ6U
	G/evm/BaUrPsB9A==
X-Received: by 2002:a05:701b:2905:b0:151:2e62:fe4b with SMTP id a92af1059eb24-1b25d338dddmr562194c88.23.1793920358113;
        Thu, 05 Nov 2026 15:12:38 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:57b2:a393:143e:afa7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa5afffasm312961eec.25.2026.11.05.15.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 15:12:37 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org,
	Rong Xu <xur@google.com>,
	Han Shen <shenhan@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Han Wang <nesthanwang@google.com>,
	Snehasish Kumar <snehasishk@google.com>,
	Nilanjana Basu <nilanjana.basu87@gmail.com>,
	Yabin Cui <yabinc@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	stable@vger.kernel.org,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: AutoFDO: Disable Profi (-fno-sample-profile-use-profi)
Date: Thu,  5 Nov 2026 15:12:00 -0800
Message-ID: <20261105151159.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Starting in Clang 21 (LLVM commit 2fc4a4a9d3a8 ("[Driver][SamplePGO]
Enable -fsample-profile-use-profi (#146795)") [1]), the Clang driver
automatically passes -mllvm -sample-profile-use-profi whenever
-fprofile-sample-use is specified, enabling LLVM's flow-based profile
inference algorithm (Profi) by default.

However, as Rong Xu noted [2], the kernel's AutoFDO implementation uses
flow-sensitive discriminators (FS-AFDO), and Profi has known issues with
FS-AFDO that degrade runtime performance compared to LLVM's original
profile propagation algorithm. In addition, Profi's min-cost max-flow
solver (applyFlowInference) can hit pathological compile times (30+
minutes or hangs) on certain kernel control-flow graphs when profiles
drift slightly or when combined with GCOV [3].

Pass -fno-sample-profile-use-profi to disable Profi and restore the
original profile propagation behavior that kernel AutoFDO was tested
with. Guard the flag with clang-min-version 210000 since it was
introduced in Clang 21 alongside the default change, whereas
CONFIG_AUTOFDO_CLANG supports Clang 17+. Note that cc-option cannot be
used to probe for the flag because cc-option invokes Clang with -Werror
but without -fprofile-sample-use, causing Clang to fail the probe with
-Werror,-Wunused-command-line-argument.

RUSTFLAGS_AUTOFDO_CLANG and KBUILD_LDFLAGS do not need changes because
SampleProfileUseProfi remains false by default in the LLVM backend and
is only enabled by the Clang driver.

Cc: stable@vger.kernel.org
Fixes: 315ad8780a12 ("kbuild: Add AutoFDO support for Clang build")
Suggested-by: Rong Xu <xur@google.com>
Link: https://github.com/llvm/llvm-project/commit/2fc4a4a9d3a87a9e11c48ef25522aa17c2a71003 [1]
Link: https://lore.kernel.org/r/CAF1bQ=S52KWHopqxksctbBirFEr5Mz1dKKMAoWh-dqLHii3Nig@mail.gmail.com [2]
Link: https://github.com/ClangBuiltLinux/linux/issues/2188 [3]
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 scripts/Makefile.autofdo | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
index 57a3aba6ffc2..8754b60ad2ab 100644
--- a/scripts/Makefile.autofdo
+++ b/scripts/Makefile.autofdo
@@ -13,6 +13,7 @@ endif
 ifdef CLANG_AUTOFDO_PROFILE
   CFLAGS_AUTOFDO_CLANG += -fprofile-sample-use=$(CLANG_AUTOFDO_PROFILE) -ffunction-sections
   CFLAGS_AUTOFDO_CLANG += -fsplit-machine-functions
+  CFLAGS_AUTOFDO_CLANG += $(if $(call clang-min-version,210000),-fno-sample-profile-use-profi)
   RUSTFLAGS_AUTOFDO_CLANG += -Zprofile-sample-use=$(CLANG_AUTOFDO_PROFILE) -Zfunction-sections=y
   RUSTFLAGS_AUTOFDO_CLANG += -Cllvm-args=-split-machine-functions
 endif
-- 
2.56.0.455.g6c5a503b38-goog

