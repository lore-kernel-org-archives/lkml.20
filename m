Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582299;
	b=2VWAh1JwQR7s8No+aPRHTnKC3Y3+gYJL+HhmeNIUZAckGtYTdilt4tExwrAWELajSw4l
	 6tdpVm+1Eaugg0o/VtAMjep9oQUnPG+aYEgxjJE0Cs0q+pRTZeSulQAmDVGxWgXOup9j3
	 KgZwdRn6B4z49KzTX9ND+2IISENAQhRkOxYhsVtM5SZmDHTE3R1Rm8fJrtCEgia0Imkmx
	 VvIRji/DnlD5AXYhuQcQs8LEnUcNgymiKrVWjLy6T4BFYc3u8N1f3bdLz4y8p8WZRKufN
	 lsuvSkO2xM87fMf3Hup56vstgUra00jP6B4Vob62E1pUmAiRuh7CwH/UQw5B8LWNCHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582299;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=B8r08F7CiB7ffv9nMyjitdMPnpUkVfo5F2a5rSdsPRU=;
	b=TF9khxjK0Q+rd625ogLkNU+uIQmwYBl3n/1Hc9891zEsCH5IGtk9KzJqs7Paay/XCMiG
	 J3WluSuLe5hadBXObrieEQBsC/eVprf5Q6N1yHHbDBPsTbqbqPycm/B4JeiYdf88qLyi2
	 o/EuB24mbSxvPlcnHqY5P6a2EAUzpgK+CzZjJeiFPO4pzNM+tVjChTs4lH8+L1ealEnze
	 2/qYyctiT3xpG7n4WP5Ms1db27juSyRQXTJyZ0OfQ2cxEtqXrXIGLlDBbiGxvpHqwU5rD
	 tpaafw3ATGixWXkmUR4tNtWdlS7uu/83skvA5qDWDv7a5Sfg8p0lX9m1oXVZXQpNp7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bYgohbRp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41816606A327;
	Fri, 13 Nov 2026 15:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bYgohbRp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 290F21F000C4;
	Fri, 13 Nov 2026 15:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794582299;
	bh=B8r08F7CiB7ffv9nMyjitdMPnpUkVfo5F2a5rSdsPRU=;
	h=Date:From:To:Cc:Subject;
	b=bYgohbRpqfTSVPU9py74kJDFrB0f+rwZBzdt09wkyYuwX/owpnqmtCwnyP0WtxIu6
	 t6J/ZUzwsx4lXy/FFFwBcrD0qPveet4WhZy23dq6GIgCogGPu37gNsFfgRiGvVBPGx
	 y7PA0KhMP4we7RRsiSrWe1gmJJ2614Ol36yZmZ3Yb3m0ncpXFGJj21TBsUyiY6WQT0
	 GrbnPkvo+9axP+6urQS5vOX18MwVIMqh+uAd7NzTsUnax9K6PpJmzoees/7RKpFWW3
	 ++xr61te7pzISob/ApKJS9V5Sb2iYGt6ldvTYOAnwfgXb44OPGpMylPjxdBDfDFISd
	 IkM4PjDJnY6Qg==
Date: Fri, 13 Nov 2026 15:04:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Thomas Huth <thuth@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the asm-generic tree
Message-ID: <avcnFxad0xS5KrZs@sirena.org.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zH5JWtwHrMr3/R3d"
Content-Disposition: inline


--zH5JWtwHrMr3/R3d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the asm-generic tree, today's linux-next build
(arm64 kselftest) failed like this:

  CC       vdso_test_chacha
/usr/include/asm-generic/int-ll64.h: Assembler messages:
/usr/include/asm-generic/int-ll64.h:20: Error: unknown mnemonic `typedef' -- `typedef __signed__ char __s8'
/usr/include/asm-generic/int-ll64.h:21: Error: unknown mnemonic `typedef' -- `typedef unsigned char __u8'
/usr/include/asm-generic/int-ll64.h:23: Error: unknown mnemonic `typedef' -- `typedef __signed__ short __s16'
/usr/include/asm-generic/int-ll64.h:24: Error: unknown mnemonic `typedef' -- `typedef unsigned short __u16'
/usr/include/asm-generic/int-ll64.h:26: Error: unknown mnemonic `typedef' -- `typedef __signed__ int __s32'
/usr/include/asm-generic/int-ll64.h:27: Error: unknown mnemonic `typedef' -- `typedef unsigned int __u32'
/usr/include/asm-generic/int-ll64.h:30: Error: unknown mnemonic `__extension__' -- `__extension__ typedef __signed__ long long __s64'
/usr/include/asm-generic/int-ll64.h:31: Error: unknown mnemonic `__extension__' -- `__extension__ typedef unsigned long long __u64'
/usr/include/linux/posix_types.h:25: Error: unknown mnemonic `typedef' -- `typedef struct{'
/usr/include/linux/posix_types.h:26: Error: unknown mnemonic `unsigned' -- `unsigned long fds_bits[1024/(8*sizeof(long))]'
/usr/include/linux/posix_types.h:27: Error: junk at end of line, first unrecognized character is `}'
/usr/include/linux/posix_types.h:30: Error: unknown mnemonic `typedef' -- `typedef void(*__kernel_sighandler_t)(int)'
/usr/include/linux/posix_types.h:33: Error: unknown mnemonic `typedef' -- `typedef int __kernel_key_t'
/usr/include/linux/posix_types.h:34: Error: unknown mnemonic `typedef' -- `typedef int __kernel_mqd_t'
/usr/lib/linux/uapi/arm64/asm/posix_types.h:5: Error: unknown mnemonic `typedef' -- `typedef unsigned short __kernel_old_uid_t'
/usr/lib/linux/uapi/arm64/asm/posix_types.h:6: Error: unknown mnemonic `typedef' -- `typedef unsigned short __kernel_old_gid_t'
/usr/include/asm-generic/posix_types.h:15: Error: unknown mnemonic `typedef' -- `typedef long __kernel_long_t'
/usr/include/asm-generic/posix_types.h:16: Error: unknown mnemonic `typedef' -- `typedef unsigned long __kernel_ulong_t'
/usr/include/asm-generic/posix_types.h:20: Error: unknown mnemonic `typedef' -- `typedef __kernel_ulong_t __kernel_ino_t'
/usr/include/asm-generic/posix_types.h:24: Error: unknown mnemonic `typedef' -- `typedef unsigned int __kernel_mode_t'
/usr/include/asm-generic/posix_types.h:28: Error: unknown mnemonic `typedef' -- `typedef int __kernel_pid_t'
/usr/include/asm-generic/posix_types.h:32: Error: unknown mnemonic `typedef' -- `typedef int __kernel_ipc_pid_t'
/usr/include/asm-generic/posix_types.h:36: Error: unknown mnemonic `typedef' -- `typedef unsigned int __kernel_uid_t'
/usr/include/asm-generic/posix_types.h:37: Error: unknown mnemonic `typedef' -- `typedef unsigned int __kernel_gid_t'
/usr/include/asm-generic/posix_types.h:41: Error: unknown mnemonic `typedef' -- `typedef __kernel_long_t __kernel_suseconds_t'
/usr/include/asm-generic/posix_types.h:45: Error: unknown mnemonic `typedef' -- `typedef int __kernel_daddr_t'
/usr/include/asm-generic/posix_types.h:49: Error: unknown mnemonic `typedef' -- `typedef unsigned int __kernel_uid32_t'
/usr/include/asm-generic/posix_types.h:50: Error: unknown mnemonic `typedef' -- `typedef unsigned int __kernel_gid32_t'
/usr/include/asm-generic/posix_types.h:59: Error: unknown mnemonic `typedef' -- `typedef unsigned int __kernel_old_dev_t'
/usr/include/asm-generic/posix_types.h:72: Error: unknown mnemonic `typedef' -- `typedef __kernel_ulong_t __kernel_size_t'
/usr/include/asm-generic/posix_types.h:73: Error: unknown mnemonic `typedef' -- `typedef __kernel_long_t __kernel_ssize_t'
/usr/include/asm-generic/posix_types.h:74: Error: unknown mnemonic `typedef' -- `typedef __kernel_long_t __kernel_ptrdiff_t'
/usr/include/asm-generic/posix_types.h:79: Error: unknown mnemonic `typedef' -- `typedef struct{'
/usr/include/asm-generic/posix_types.h:80: Error: unknown mnemonic `int' -- `int val[2]'
/usr/include/asm-generic/posix_types.h:81: Error: junk at end of line, first unrecognized character is `}'
/usr/include/asm-generic/posix_types.h:87: Error: unknown mnemonic `typedef' -- `typedef __kernel_long_t __kernel_off_t'
/usr/include/asm-generic/posix_types.h:88: Error: unknown mnemonic `typedef' -- `typedef long long __kernel_loff_t'
/usr/include/asm-generic/posix_types.h:89: Error: unknown mnemonic `typedef' -- `typedef __kernel_long_t __kernel_old_time_t'
/usr/include/asm-generic/posix_types.h:90: Error: unknown mnemonic `typedef' -- `typedef __kernel_long_t __kernel_time_t'
/usr/include/asm-generic/posix_types.h:91: Error: unknown mnemonic `typedef' -- `typedef long long __kernel_time64_t'
/usr/include/asm-generic/posix_types.h:92: Error: unknown mnemonic `typedef' -- `typedef __kernel_long_t __kernel_clock_t'
/usr/include/asm-generic/posix_types.h:93: Error: unknown mnemonic `typedef' -- `typedef int __kernel_timer_t'
/usr/include/asm-generic/posix_types.h:94: Error: unknown mnemonic `typedef' -- `typedef int __kernel_clockid_t'
/usr/include/asm-generic/posix_types.h:95: Error: unknown mnemonic `typedef' -- `typedef char*__kernel_caddr_t'
/usr/include/asm-generic/posix_types.h:96: Error: unknown mnemonic `typedef' -- `typedef unsigned short __kernel_uid16_t'
/usr/include/asm-generic/posix_types.h:97: Error: unknown mnemonic `typedef' -- `typedef unsigned short __kernel_gid16_t'
/usr/include/linux/types.h:12: Error: unknown mnemonic `typedef' -- `typedef __signed__ __int128 __s128 __attribute__((aligned(16)))'
/usr/include/linux/types.h:13: Error: unknown mnemonic `typedef' -- `typedef unsigned __int128 __u128 __attribute__((aligned(16)))'
/usr/include/linux/types.h:31: Error: unknown mnemonic `typedef' -- `typedef __u16 __le16'
/usr/include/linux/types.h:32: Error: unknown mnemonic `typedef' -- `typedef __u16 __be16'
/usr/include/linux/types.h:33: Error: unknown mnemonic `typedef' -- `typedef __u32 __le32'
/usr/include/linux/types.h:34: Error: unknown mnemonic `typedef' -- `typedef __u32 __be32'
/usr/include/linux/types.h:35: Error: unknown mnemonic `typedef' -- `typedef __u64 __le64'
/usr/include/linux/types.h:36: Error: unknown mnemonic `typedef' -- `typedef __u64 __be64'
/usr/include/linux/types.h:38: Error: unknown mnemonic `typedef' -- `typedef __u16 __sum16'
/usr/include/linux/types.h:39: Error: unknown mnemonic `typedef' -- `typedef __u32 __wsum'
/usr/include/linux/types.h:55: Error: unknown mnemonic `typedef' -- `typedef unsigned __poll_t'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:88: Error: unknown mnemonic `struct' -- `struct user_pt_regs{'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:89: Error: unknown mnemonic `__u64' -- `__u64 regs[31]'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:90: Error: unknown mnemonic `__u64' -- `__u64 sp'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:91: Error: unknown mnemonic `__u64' -- `__u64 pc'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:92: Error: unknown mnemonic `__u64' -- `__u64 pstate'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:93: Error: junk at end of line, first unrecognized character is `}'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:95: Error: unknown mnemonic `struct' -- `struct user_fpsimd_state{'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:96: Error: unknown mnemonic `__uint128_t' -- `__uint128_t vregs[32]'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:97: Error: unknown mnemonic `__u32' -- `__u32 fpsr'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:98: Error: unknown mnemonic `__u32' -- `__u32 fpcr'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:99: Error: unknown mnemonic `__u32' -- `__u32 __reserved[2]'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:100: Error: junk at end of line, first unrecognized character is `}'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:102: Error: unknown mnemonic `struct' -- `struct user_hwdebug_state{'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:103: Error: unknown mnemonic `__u32' -- `__u32 dbg_info'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:104: Error: unknown mnemonic `__u32' -- `__u32 pad'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:105: Error: unknown mnemonic `struct' -- `struct {'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:106: Error: unknown mnemonic `__u64' -- `__u64 addr'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:107: Error: unknown mnemonic `__u32' -- `__u32 ctrl'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:108: Error: unknown mnemonic `__u32' -- `__u32 pad'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:109: Error: junk at end of line, first unrecognized character is `}'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:110: Error: junk at end of line, first unrecognized character is `}'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:114: Error: unknown mnemonic `struct' -- `struct user_sve_header{'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:115: Error: unknown mnemonic `__u32' -- `__u32 size'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:116: Error: unknown mnemonic `__u32' -- `__u32 max_size'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:117: Error: unknown mnemonic `__u16' -- `__u16 vl'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:118: Error: unknown mnemonic `__u16' -- `__u16 max_vl'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:119: Error: unknown mnemonic `__u16' -- `__u16 flags'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:120: Error: unknown mnemonic `__u16' -- `__u16 __reserved'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:121: Error: junk at end of line, first unrecognized character is `}'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:253: Error: unknown mnemonic `struct' -- `struct user_pac_mask{'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:254: Error: unknown mnemonic `__u64' -- `__u64 data_mask'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:255: Error: unknown mnemonic `__u64' -- `__u64 insn_mask'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:256: Error: junk at end of line, first unrecognized character is `}'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:260: Error: unknown mnemonic `struct' -- `struct user_pac_address_keys{'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:261: Error: unknown mnemonic `__uint128_t' -- `__uint128_t apiakey'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:262: Error: unknown mnemonic `__uint128_t' -- `__uint128_t apibkey'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:263: Error: unknown mnemonic `__uint128_t' -- `__uint128_t apdakey'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:264: Error: unknown mnemonic `__uint128_t' -- `__uint128_t apdbkey'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:265: Error: junk at end of line, first unrecognized character is `}'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:267: Error: unknown mnemonic `struct' -- `struct user_pac_generic_keys{'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:268: Error: unknown mnemonic `__uint128_t' -- `__uint128_t apgakey'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:269: Error: junk at end of line, first unrecognized character is `}'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:273: Error: unknown mnemonic `struct' -- `struct user_za_header{'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:274: Error: unknown mnemonic `__u32' -- `__u32 size'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:275: Error: unknown mnemonic `__u32' -- `__u32 max_size'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:276: Error: unknown mnemonic `__u16' -- `__u16 vl'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:277: Error: unknown mnemonic `__u16' -- `__u16 max_vl'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:278: Error: unknown mnemonic `__u16' -- `__u16 flags'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:279: Error: unknown mnemonic `__u16' -- `__u16 __reserved'
/usr/lib/linux/uapi/arm64/asm/ptrace.h:280: Error: junk at end of line, first unrecognized character is `}'
make[1]: *** [../lib.mk:230: /tmp/next/arm64_kselftest/kselftest/vDSO/vdso_test_chacha] Error 1

Caused by commit

   625b37748a148 (treewide: Stop defining __ASSEMBLY__ for assembler files)

I have used the tree from next-20261112 instead.

--zH5JWtwHrMr3/R3d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr3JxYACgkQJNaLcl1U
h9DcTAgAgzSMmq47eN/JS2TLfCVr8CsTcM2Am3diWK9vj9Z3gJ4GaZk7RXtXx/to
fsS85Eju1VSEF9eFMHRBNEpMq8uV4Zyv1iIvDERxuFB0QgSdIgRsR64VDyA1WFMG
PhI+9H3SEcpNFRH5PVeR4aLxapAPM+1Z+b2l6n1q9lYk3wKBs3AOxRVSVBhkNUeY
R6gEcrrGLH8H+CxUJG9h5qf42QCytSwSmb1gAtLJ+dO3Tjj4sm5PhPMsBqzP8qEa
QKS6aCznmAp99LPQ4RMuayHXLYXWMuVtgwo9Q+DEu/oPpWhs6ua+dW4/6BG9I57I
dEAIskZUJdbybKrfKjPF1oY80DBZHA==
=/PK9
-----END PGP SIGNATURE-----

--zH5JWtwHrMr3/R3d--
