Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717985;
	b=k3oeTtfr1MQvmej17lpJR142i2citJ1KfBpXDfnhze9Guq+LqnYmeu4SkqufbFVan3sf
	 vkvAnLipxWySJgF/ISNFPAhY0ivla7403OSMAffYmT1dp8w2jwB+Z8xfM6tP/93tlZihR
	 sdixjOfiMWM4Ssx9hUqR557eBQUBizsgCvAvKDMkIG2qaGE2Spr1tgjwuJjzUV5WPP2Ry
	 +nelSOsi8iIgHYCzd5++yD4lOs2IOQU1rzJcQaxSIts7rdHx4MbqHVOa9Uoafw0ncktBM
	 4H8lNzxRQWTL0w5pYJfyEus3k4XuVZFLg0MA7ml5PDQHlhsgIh98/mkmbSzxmVzdZsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717985;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=IM+1RgzSobDQIBX09DxtUeK1N1jGgq/jWUn0IK/XZXU=;
	b=hR22BFldOqren+KuFjVpUvw4pd8AmSh8pQf8IQ3ECVUzjFZjpALfhvvWJGllNdNZjsQq
	 8Exp7h4kdCoZ/iHgY779Y5KZkcp6Xq2cLfbWKOfCllWHE+mbt+II0AfAsigqWaaUTGtd+
	 FL2uyuRvx8wKGzxgUhwXDAoNlWPnjE5tU+uQ6zDHekO38Rd199fBpWQwqAsCIHs7s01uQ
	 7YLY0gIDn0xhmBkuYj8MmAnSrmcJJZqoSrlIs+t3dLS7kpSaze2q7dKZ9lMS42MXqS3ml
	 nhpyCdfGe7zEWudeU5PlVCWXhiQ5D/5MX+1xhKlk0tlSKVmIFypeJtgIv3ARCabCyOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PzT2bDRS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3051606D2CF;
	Tue,  3 Nov 2026 14:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PzT2bDRS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B6B61F00919;
	Tue,  3 Nov 2026 14:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793717984;
	bh=IM+1RgzSobDQIBX09DxtUeK1N1jGgq/jWUn0IK/XZXU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PzT2bDRSrhqQ0F2rOrBFcBhjI8gdRExkYj9hPpc9rrwURLCrkPkC6XgRMwfKkL986
	 m5n3nx3Q8Y29xpvr6Nd3NcDraqQsMM6HfN1+IF5D5cojzrHofCFeWBNT72iZgxxLsT
	 oR5OE8oaKIBeKnnUtevP377Bzu4r8uSoOdSol+ItkDH/1vEfv73IENJgk8RKwDCDT6
	 7MIApaI9cUWb+OYQeMhGzybtu7a/N2HaDukAklS7J3vsvazsVLWLUsydNbtrLEn44t
	 1/+Hsr8zZfnE8YWElzA0e14Mx5IFkqtQUBpIZTxodbqguUdFT+m3gNddk0R8UoQJAF
	 h1HsNBGihLwTw==
From: Thorsten Blum <blum@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Marco Elver <elver@google.com>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Jeff Layton <jlayton@kernel.org>,
	x86@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <blum@kernel.org>,
	=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
Subject: [PATCH RESEND 3/3] Documentation/arch/x86: Remove obsolete vdso32=2 compatibility note
Date: Tue,  3 Nov 2026 15:58:52 +0100
Message-ID: <20261103145848.427309-8-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103145848.427309-5-blum@kernel.org>
References: <20261103145848.427309-5-blum@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1587; i=blum@kernel.org; h=from:subject; bh=iRTIBZSKgDjBlKzRDHcpEWeGBaUEIKpSqY712sM0Jmg=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkvv22pDg+YmPzjyxvPyl+63zTzODZpnTL11XD8cZ2dt aKzfsfbjlIWBjEuBlkxRZYHs37M8C2tqdxkErETZg4rE8gQBi5OAZhI+HtGhvWpVk/PfRfzK5Vm +c7mkb1p0c9Pp1weaDO93nYiZgYjhwAjwwJbo06JHLtp5zodPnO9qPl7S3btmS9ld41/d6oYXTw nyQcA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Commit b0b49f2673f0 ("x86, vdso: Remove compat vdso support") removed
compat vDSO support and documented vdso32=2 as an alias for vdso32=0.

However, since commit c06989da39cd ("x86/vdso: Ensure vdso32_enabled
gets set to valid values only"), vdso32_setup() accepts only 0 and 1.

Remove the obsolete vdso32=2 compatibility note and document only the
supported values.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Habil Eren Türker <habilerenturker@hotmail.com>
Tested-by: Habil Eren Türker <habilerenturker@hotmail.com>
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0b3c140babd9..695403c8aa7f 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8333,15 +8333,12 @@ Kernel parameters
 
 	vdso32=		[X86] Control the 32-bit vDSO
 			vdso32=1: enable 32-bit VDSO
-			vdso32=0 or vdso32=2: disable 32-bit VDSO
+			vdso32=0: disable 32-bit VDSO
 
 			See the help text for CONFIG_COMPAT_VDSO for more
 			details.  If CONFIG_COMPAT_VDSO is set, the default is
 			vdso32=0; otherwise, the default is vdso32=1.
 
-			For compatibility with older kernels, vdso32=2 is an
-			alias for vdso32=0.
-
 			Try vdso32=0 if you encounter an error that says:
 			dl_main: Assertion `(void *) ph->p_vaddr == _rtld_local._dl_sysinfo_dso' failed!
 
