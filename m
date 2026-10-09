Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C5445D91C
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791541163; cv=none; b=Hlo+I03NtaYlI35GXEMolCmZ8T4SdXvfF3uC0DDLgrsau60RYShT7D0zsINUDR+ADoocYeYodEfeQOZHbGO889H/IunHohlB5nk11Bm0oOIJ4qH77TBW1KFYHdLPCws4MsJDglA7PBMJqd9B8gcr66wLhR+a72KfLsXBdg7PuzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791541163; c=relaxed/simple;
	bh=/fkyHXb3VwCsr5Urp3Xp9YIdu8mewUpcr+aDP8HiP/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tBw8YAcMpPTizEPdAANCpUp02MUmq+XF6K34LzESro5ZQLP/bSqVQpqg27j68Iy0UR07/e9COlk6rFjPw39pUex3vH/JYSKILbZsiBY5lOZfJ9i2dXlrWQGKmEE0PyNGAtURPshhNgLpUx0xkOW/GVaqHyEDi6CdMJLT7DhhEeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=egicon.com; spf=pass smtp.mailfrom=egicon.com; dkim=pass (2048-bit key) header.d=egicon.com header.i=@egicon.com header.b=CQUqNEWx; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=egicon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=egicon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=egicon.com header.i=@egicon.com header.b="CQUqNEWx"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48b0584ad71so2571700f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 03:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=egicon.com; s=google; t=1791541159; x=1792145959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A+PiZHw29u045WP6AUybYl05Nsv+v/dCEoZaPbR/Ppc=;
        b=CQUqNEWxvAxnNE8pfPYEpVj+2WQC8F0ZY4XSjvaI+fyoVgpow6y4UMAp6g1JAmyQo+
         kc6ZHza8MtAve+xOnSuhcM/7ghPGFcaAWyztx0l1+WS1zrzFgVPyvqYW+aGNXdGflckR
         ocJBh/wm/ergA9dV67wnKDHUPXQSjGcAfGxCqb+4KcQBqZ1Xg1CxJLDiEmFxaVh6Wrs7
         LIOTzNWcaJE90GQISo6d67Bs4CgQFQgxFRcEbyrql85kyBsjiDANbeSlH0FcMUTU+Qg2
         /HVw5y19Y9JKV56CPrQEsTb81PdEuIDDWuVaxctRZ3b/V5EKrjJp36Uq/KXJIss6vs5j
         gZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791541159; x=1792145959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A+PiZHw29u045WP6AUybYl05Nsv+v/dCEoZaPbR/Ppc=;
        b=UJpGD3vH8l19ApDyr5GKEYWW2CFPzZkJBB/J6/UDblnAiO0aMC9KohebEVnr0hvl+G
         xHV9X7r6Y0Z98IqFgDlM6gwkb+WoPo7Tmcf0dRW0TQLN130ELsKRDIoD2sL+4X1VtDsV
         7RGWdjk2YaYF3Q28+if1XGmen3lPFjkfMOnBfV0Bq9G2N9QrBe2FAU3QpB2fe98BNiQb
         MZXyBYO6EnQcNB3X57fXScifJiOK8wH9Dak5l8SNxdAGXVwxbeVfdfkOnhSUqnaGMltI
         8cQgl801HaWAsG/2KCv3JBIlKau1Qug+3cA7zoCJbhY5qOqio5GyEEh4384FiHx9mtfU
         qETQ==
X-Forwarded-Encrypted: i=1; AKwUvByFTOP0PbSxRDOoyuKQR3TTv2cincmT7/hdqTHTQb5hx7eE4O9/gnnt4IVyZCZ/vi43XzeEndiQEuus2VY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZCre4gkF4S4kIGsxIMRlfD9qHJFl7fGWwb9NbIHmiU/GMYV5y
	3QI7eOuM9pvRm6ycI4Dm+dYNcVweVEyK1RMVMSMwOF/umpP9uGB/zXwxmA1Cv0THbw==
X-Gm-Gg: AYBFou0XJrJ/D2CU20907DDT506/kd05Gg6VdNX8M0w/Y6QMdVxHigp9OlPtnd6oBF3
	l8Xq6yHnmbdVBm/ybbWP+ESLB2LrRJGMTnO8SmIteWyjpWwUAbimLzkoEnOKOAHZRh38z5aAlv5
	VddVEDpUMxVwtS5bOnB/41HFO8FFkAbHOjcJpGNC7JqV9F1KqIxfrt8Lym3aMzuDPMnoQv4j9uk
	I+/zaYisvMn8o12ibIjNj+XXOMUEJhDrdI729pLfWvACOqHAw5rTEb1DQTEwKMU8ZXVPaOKZ7n6
	ODbIJf0WhcivByS9HehvO7gTMSvYwaYPac2WqizQ6Fs4OyydLJlbRA/SOGNUoVGDyPb6ZcY6ClV
	2n5V2jRruz9A/2fAhW7n8niWwToUulHcB3ziF3Bc+9gVntIy4MccUdYkKc2Pw4A1FXLTAnn/CIg
	41enHHW9t7N3qtMFtFzFkNm6w+9tgQwzaR2FSXiOC9/wgZq2M6c7Uhmq+WB6llIAaFhbamiYRm4
	neGd2sZUMcyUVJ8GFL2TgjHIAKGUP6airut6Ee3EN5uyB8/t9MuEhsjmmO0TOJ3Og==
X-Received: by 2002:a05:6000:41cc:b0:48c:7037:aee9 with SMTP id ffacd0b85a97d-48dbad48cc3mr2103538f8f.50.1791541159545;
        Fri, 09 Oct 2026 03:19:19 -0700 (PDT)
Received: from xpsmax.egicon.com ([37.179.95.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acf12bsm3189363f8f.46.2026.10.09.03.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 03:19:19 -0700 (PDT)
From: Massimiliano Marretta <massimiliano.marretta@egicon.com>
To: David Howells <dhowells@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: keyrings@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Massimiliano Marretta <massimiliano.marretta@egicon.com>
Subject: [PATCH 1/2] scripts/sign-file: add bulk module signing support
Date: Fri,  9 Oct 2026 12:19:14 +0200
Message-ID: <20261009101915.495734-2-massimiliano.marretta@egicon.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009101915.495734-1-massimiliano.marretta@egicon.com>
References: <20261009101915.495734-1-massimiliano.marretta@egicon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When signing kernel modules with a private key stored on a PKCS#11
token (e.g. a Nitrokey HSM or a SmartCard-HSM), every invocation of
scripts/sign-file pays a fixed initialization cost that dominates
the actual signing time. On the reported hardware this cost is
about 25-36 seconds per invocation, mostly spent in token
initialization, PIN verification and session setup.

Since a typical kernel build produces hundreds of modules, signing
them one by one is impractical.

Add a new '-b' (bulk) option that accepts multiple module files in
a single invocation. The private key and the X.509 certificate are
loaded once, then each module is signed in sequence, reusing the
same OpenSSL and PKCS#11 context.

Measured on 50 modules with a key stored on a SmartCard-HSM:
  - individual invocations: ~24 minutes
  - bulk mode:              ~3 min 17 s

The fixed per-invocation overhead is eliminated (~25-36 s), while
the per-module cost is unchanged (~3.2 s).

The default behavior is unchanged: without '-b', sign-file works
exactly as before.

Signed-off-by: Massimiliano Marretta <massimiliano.marretta@egicon.com>
---
 scripts/sign-file.c | 159 ++++++++++++++++++++++++++++----------------
 1 file changed, 100 insertions(+), 59 deletions(-)

diff --git a/scripts/sign-file.c b/scripts/sign-file.c
index 86b010ac1514..241f4538fd17 100644
--- a/scripts/sign-file.c
+++ b/scripts/sign-file.c
@@ -46,9 +46,11 @@ static __attribute__((noreturn))
 void format(void)
 {
 	fprintf(stderr,
-		"Usage: scripts/sign-file [-dp] <hash algo> <key> <x509> <module> [<dest>]\n");
+		"Usage: scripts/sign-file [-dpk] <hash algo> <key> <x509> <module> [<dest>]\n");
 	fprintf(stderr,
 		"       scripts/sign-file -s <raw sig> <hash algo> <x509> <module> [<dest>]\n");
+	fprintf(stderr,
+		"       scripts/sign-file -b [-dpk] <hash algo> <key> <x509> <module> [<module> ...]\n");
 	exit(2);
 }
 
@@ -183,76 +185,25 @@ static X509 *read_x509(const char *x509_name)
 	return x509;
 }
 
-int main(int argc, char **argv)
+static void sign_single_file(const char *hash_algo, const char *module_name,
+			     const char *dest_name, bool replace_orig,
+			     bool save_sig, bool sign_only, bool raw_sig,
+			     const char *raw_sig_name, unsigned int use_keyid,
+			     EVP_PKEY *private_key, X509 *x509)
 {
 	struct module_signature sig_info = { .id_type = MODULE_SIGNATURE_TYPE_PKCS7 };
-	char *hash_algo = NULL;
-	char *private_key_name = NULL, *raw_sig_name = NULL;
-	char *x509_name, *module_name, *dest_name;
-	bool save_sig = false, replace_orig;
-	bool sign_only = false;
-	bool raw_sig = false;
 	unsigned char buf[4096];
 	unsigned long module_size, sig_size;
 	const EVP_MD *digest_algo;
-	EVP_PKEY *private_key;
 	CMS_ContentInfo *cms = NULL;
-	unsigned int use_keyid = 0;
-	X509 *x509;
 	BIO *bd, *bm;
-	int opt, n;
-	OpenSSL_add_all_algorithms();
-	ERR_load_crypto_strings();
-	ERR_clear_error();
-
-	key_pass = getenv("KBUILD_SIGN_PIN");
-
-	do {
-		opt = getopt(argc, argv, "sdpk");
-		switch (opt) {
-		case 's': raw_sig = true; break;
-		case 'p': save_sig = true; break;
-		case 'd': sign_only = true; save_sig = true; break;
-		case 'k': use_keyid = CMS_USE_KEYID; break;
-		case -1: break;
-		default: format();
-		}
-	} while (opt != -1);
-
-	argc -= optind;
-	argv += optind;
-	if (argc < 4 || argc > 5)
-		format();
-
-	if (raw_sig) {
-		raw_sig_name = argv[0];
-		hash_algo = argv[1];
-	} else {
-		hash_algo = argv[0];
-		private_key_name = argv[1];
-	}
-	x509_name = argv[2];
-	module_name = argv[3];
-	if (argc == 5 && strcmp(argv[3], argv[4]) != 0) {
-		dest_name = argv[4];
-		replace_orig = false;
-	} else {
-		ERR(asprintf(&dest_name, "%s.~signed~", module_name) < 0,
-		    "asprintf");
-		replace_orig = true;
-	}
+	int n;
 
 	/* Open the module file */
 	bm = BIO_new_file(module_name, "rb");
 	ERR(!bm, "%s", module_name);
 
 	if (!raw_sig) {
-		/* Read the private key and the X.509 cert the PKCS#7 message
-		 * will point to.
-		 */
-		private_key = read_private_key(private_key_name);
-		x509 = read_x509(x509_name);
-
 		/* Digest the module data. */
 		OpenSSL_add_all_digests();
 		drain_openssl_errors(__LINE__, 0);
@@ -307,7 +258,8 @@ int main(int argc, char **argv)
 
 		if (sign_only) {
 			BIO_free(bm);
-			return 0;
+			CMS_ContentInfo_free(cms);
+			return;
 		}
 	}
 
@@ -354,5 +306,94 @@ int main(int argc, char **argv)
 	if (replace_orig)
 		ERR(rename(dest_name, module_name) < 0, "%s", dest_name);
 
+	CMS_ContentInfo_free(cms);
+}
+
+int main(int argc, char **argv)
+{
+	char *hash_algo = NULL;
+	char *private_key_name = NULL, *raw_sig_name = NULL;
+	char *x509_name, *module_name, *dest_name;
+	bool save_sig = false, replace_orig;
+	bool sign_only = false;
+	bool raw_sig = false, bulk = false;
+	EVP_PKEY *private_key = NULL;
+	X509 *x509 = NULL;
+	unsigned int use_keyid = 0;
+	int opt, i, nmodules;
+
+	OpenSSL_add_all_algorithms();
+	ERR_load_crypto_strings();
+	ERR_clear_error();
+
+	key_pass = getenv("KBUILD_SIGN_PIN");
+
+	do {
+		opt = getopt(argc, argv, "sdpkb");
+		switch (opt) {
+		case 's': raw_sig = true; break;
+		case 'p': save_sig = true; break;
+		case 'd': sign_only = true; save_sig = true; break;
+		case 'k': use_keyid = CMS_USE_KEYID; break;
+		case 'b': bulk = true; break;
+		case -1: break;
+		default: format();
+		}
+	} while (opt != -1);
+
+	argc -= optind;
+	argv += optind;
+
+	if (raw_sig && bulk)
+		format();
+
+	if (bulk) {
+		if (argc < 4)
+			format();
+	} else if (argc < 4 || argc > 5) {
+		format();
+	}
+
+	if (raw_sig) {
+		raw_sig_name = argv[0];
+		hash_algo = argv[1];
+	} else {
+		hash_algo = argv[0];
+		private_key_name = argv[1];
+	}
+	x509_name = argv[2];
+
+	if (!raw_sig) {
+		private_key = read_private_key(private_key_name);
+		x509 = read_x509(x509_name);
+	}
+
+	/* In bulk mode all remaining arguments are module names.  In the
+	 * normal mode there is exactly one module name.
+	 */
+	nmodules = bulk ? argc - 3 : 1;
+	for (i = 0; i < nmodules; i++) {
+		module_name = argv[3 + i];
+		dest_name = NULL;
+		replace_orig = true;
+
+		if (!bulk && argc == 5 && strcmp(argv[3], argv[4]) != 0) {
+			dest_name = argv[4];
+			replace_orig = false;
+		} else {
+			ERR(asprintf(&dest_name, "%s.~signed~", module_name) < 0,
+			    "asprintf");
+		}
+
+		sign_single_file(hash_algo, module_name, dest_name, replace_orig,
+				 save_sig, sign_only, raw_sig, raw_sig_name, use_keyid,
+				 private_key, x509);
+
+		if (replace_orig)
+			free(dest_name);
+	}
+
+	EVP_PKEY_free(private_key);
+	X509_free(x509);
 	return 0;
 }
-- 
2.43.0

