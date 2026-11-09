Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.75.44.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196540;
	b=WcqKyA2ngZThFDYdpZgcMB7SZ6vyvyFeL4IvTSoqcny7JgSPq/QuVnF60xwXz6+iQqJo
	 Ths0d692nC5IyaG9FBxiA7rCjvvKvFFiJFwAuRqEeMqdHrxTQwLcZnsavossnlnzYTmkH
	 qfRP3Ae3D4ydo2RE7WL/D7Ad1y+YtEmQTPIwFsx4xQHUi3oVMrqf2YKuudT9rrxqYdbby
	 rVvND8ZcqZjF1ivyNm6TRSgMTStB9rIi+SBw+ewUF1y3jK+Hf0k1OUBQrLJG/WKVCtPJv
	 0O5NDJWyxmNd2w2X5+5UlStzXE33Kmdvrwn2setkDa9lZ+TaCEKXcOfjgu1SjHQbBaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196540;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=XPh+OcnEJvfGT6LN2h2fnqdHO1FoKDbHfQDe0DB04t0=;
	b=n0WGTh9WfFu73VHHCu9elqN5e0wESp9wcD3GPalFIvHm4sSrx2lpYfA9fyOLBRTG6bp5
	 re28LcJOzIUGhbO0tUvSEKwaQViayYZy+7lfLvk5AsYi8e69vZL5fME443W6sssJUs7Jg
	 8rAD7eRE9zAfhjnorEu0EPo6G1frPPXDZMqO5fziB/qKRFi4aMmYfG9to8mXi3oou5wpa
	 DJJLmBtrC5r4Nl3BBQ3Wz+hJ9P4YP4B69NjwwdiVX7Rjvvsdf2JEi2/44g6ccF5HdvHce
	 fh548L+C3JUNnu/g5WH7XWcJVylSGcmPyFpf7/GYWODHAFnqX7UzmcQPZxMAj5btLkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=13.75.44.102
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.75.44.102])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FF38606A31C;
	Mon,  9 Nov 2026 03:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FF38606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with UTF8SMTP id IQEQrMAWPsY1RPFqiwoKAA--.22638S2;
	Mon, 09 Nov 2026 11:55:33 +0800 (CST)
Received: from hust.edu.cn (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wCXYh4yRPFqgWQQAA--.21328S2;
	Mon, 09 Nov 2026 11:55:31 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] docs: improve translation update checks across locales
Date: Mon,  9 Nov 2026 11:55:30 +0800
Message-ID: <4c0221d662b7e8521d93000ad6ae09300dbda9c1.1794196480.git.dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261107000338.1243411-1-dzm91@hust.edu.cn>
References: <20261107000338.1243411-1-dzm91@hust.edu.cn>
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
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IQEQrMAWPsY1RPFqiwoKAA--.22638S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvAXoW3CF1fXw1UKFW7CFWUZrykGrg_yoW8XFWfJo
	ZxWw45Cw1Ivw45JF1UCr4kJFy3CF1SkF4kA345Cw1q9w12ywsYg3yfZwn8Wa4fArW3ur93
	Z343XayrXa1qyF93n29KB7ZKAUJUUUU3529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUOG7k0a2IF6w4kM7kC6x804xWl1xkIjI8I6I8E6xAIw20EY4v2
	0xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7
	IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJr0_GcWl84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtw
	CY02Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC2
	0s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
	W8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07bxv3nUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Improve locale-wide scans and report English documents without matching
translations. When a translation commit lacks its English source in its
history, use the source history at HEAD for the author-date fallback.
Capture Git errors for unavailable commit IDs, honor --logfile, and stop
at the first file that cannot be checked.

Update the English and zh_CN guides to describe the fallback behavior,
directory arguments, and logging options.

Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
---
v1->v2: add the missing sign-off-by tag

 Documentation/doc-guide/checktransupdate.rst  | 42 ++++++++--
 .../zh_CN/doc-guide/checktransupdate.rst      | 38 ++++++---
 tools/docs/checktransupdate.py                | 83 ++++++++++---------
 3 files changed, 107 insertions(+), 56 deletions(-)

diff --git a/Documentation/doc-guide/checktransupdate.rst b/Documentation/doc-guide/checktransupdate.rst
index 7b25375cc6d9..94366110451a 100644
--- a/Documentation/doc-guide/checktransupdate.rst
+++ b/Documentation/doc-guide/checktransupdate.rst
@@ -10,17 +10,35 @@ the English counterpart.
 How it works
 ------------
 
-It uses ``git log`` command to track the latest English commit from the
-translation commit (order by author date) and the latest English commits
-from HEAD. If any differences occur, the file is considered as out-of-date,
-then commits that need to be updated will be collected and reported.
+The English kernel documentation and its translation use the same relative path
+below ``Documentation/`` and ``Documentation/translations/<locale>/``.
+For example, ``Documentation/process/foo.rst`` corresponds to
+``Documentation/translations/zh_CN/process/foo.rst``. A locale-wide check
+starts with English files and reports any without a translation at the
+corresponding path. A translated file at a different path is not treated as
+its translation. When explicitly checked, the script reports that it cannot
+find a same-path English source for such a file. This says nothing about
+the accuracy of any existing source-path annotation in that file. The script
+does not read ``:Original:`` fields.
+
+The script uses ``git log`` to find the latest English commit corresponding
+to the translation and the latest English commit at HEAD. It first checks
+the translation commit message for ``update to commit`` or ``Update the
+translation through commit`` followed by a 12-character hexadecimal commit
+hash. Otherwise, it estimates the source revision by author date. This
+includes cases where the translation and English source were initially
+merged on different branches, or the named commit is unavailable in the
+local Git history. The estimate can be inaccurate, especially when commits
+are backdated or the source has moved.
+If the two English revisions differ, the script reports the commits to review.
 
 Features implemented
 
 -  check all files in a certain locale
 -  check a single file or a set of files
--  provide options to change output format
+-  select the logging level and log file
 -  track the translation status of files that have no translation
+-  check files in a directory
 
 Usage
 -----
@@ -34,9 +52,14 @@ Please refer to the output of argument parser for usage details.
 Samples
 
 -  ``tools/docs/checktransupdate.py -l zh_CN``
-   This will print all the files that need to be updated in the zh_CN locale.
+   This checks for updates to zh_CN translations and lists English files
+   without a corresponding translation.
 -  ``tools/docs/checktransupdate.py Documentation/translations/zh_CN/dev-tools/testing-overview.rst``
    This will only print the status of the specified file.
+-  ``tools/docs/checktransupdate.py -l sp_SP``
+   This will check Spanish translations at the corresponding paths.
+-  ``tools/docs/checktransupdate.py Documentation/translations/it_IT/process``
+   This will check translated files under the directory.
 
 Then the output is something like:
 
@@ -49,6 +72,7 @@ Then the output is something like:
     commit 42fb9cfd5b18 ("Documentation: dev-tools: Add link to RV docs")
     1 commits needs resolving in total
 
-Features to be implemented
-
-- files can be a folder instead of only a file
+The script stops at the first translated file it cannot check and exits with
+a nonzero status.
+It does not determine whether the translated text fully reflects the English
+source; review the reported commits and the files themselves.
diff --git a/Documentation/translations/zh_CN/doc-guide/checktransupdate.rst b/Documentation/translations/zh_CN/doc-guide/checktransupdate.rst
index dbfd65398077..c3cc16d9897c 100644
--- a/Documentation/translations/zh_CN/doc-guide/checktransupdate.rst
+++ b/Documentation/translations/zh_CN/doc-guide/checktransupdate.rst
@@ -7,21 +7,36 @@
 :译者: 慕冬亮 Dongliang Mu <dzm91@hust.edu.cn>
 
 检查翻译更新
+============
 
-这个脚本帮助跟踪不同语言的文档翻译状态，即文档是否与对应的英文版本保持更新。
+这个脚本帮助跟踪不同语言的文档翻译状态，判断译文是否需要根据英文原文更新。
 
 工作原理
 ------------
 
-它使用 ``git log`` 命令来跟踪翻译提交的最新英文提交（按作者日期排序）和英文文档的
-最新提交。如果有任何差异，则该文件被认为是过期的，然后需要更新的提交将被收集并报告。
+英文原文与译文在 ``Documentation/`` 和
+``Documentation/translations/<locale>/`` 下使用相同的相对路径。例如，
+``Documentation/process/foo.rst`` 对应
+``Documentation/translations/zh_CN/process/foo.rst``。检查整个语言目录时，
+脚本从英文文件出发，报告在对应路径下没有译文的文件。其他路径下的译文不会被
+视为该英文文件的翻译。如果单独检查这类译文，脚本会报告找不到同路径的英文原文。
+这并不表示该译文中已有的原文路径标注有误。脚本不读取 ``:Original:`` 字段。
+
+脚本使用 ``git log`` 查找译文对应的最新英文提交，以及英文文件在 HEAD 中的
+最新提交。它先从翻译提交信息中查找 ``update to commit`` 或
+``Update the translation through commit`` 后面的 12 位十六进制提交哈希。
+如果没有找到，或指定的提交不在本地 Git 历史中，就按作者日期估计译文所依据的
+英文版本。英文原文和译文最初从不同分支合入时，脚本也会使用这一估计。提交日期
+被回填或英文原文移动过路径时，这种估计可能不准确。如果两个英文提交不同，脚本
+会列出需要检查的提交。
 
 实现的功能
 
 - 检查特定语言中的所有文件
 - 检查单个文件或一组文件
-- 提供更改输出格式的选项
+- 选择日志级别和日志文件
 - 跟踪没有翻译过的文件的翻译状态
+- 检查目录中的文件
 
 用法
 -----
@@ -30,14 +45,18 @@
 
     tools/docs/checktransupdate.py --help
 
-具体用法请参考参数解析器的输出
+具体用法请参考参数解析器的输出。
 
 示例
 
 -  ``tools/docs/checktransupdate.py -l zh_CN``
-   这将打印 zh_CN 语言中需要更新的所有文件。
+   检查 zh_CN 语言中需要更新的文件，并列出尚无译文的英文文件。
 -  ``tools/docs/checktransupdate.py Documentation/translations/zh_CN/dev-tools/testing-overview.rst``
-   这将只打印指定文件的状态。
+   只检查指定文件的状态。
+-  ``tools/docs/checktransupdate.py -l sp_SP``
+   检查西班牙语译文在对应路径下的更新状态。
+-  ``tools/docs/checktransupdate.py Documentation/translations/it_IT/process``
+   检查该目录下的译文。
 
 然后输出类似如下的内容：
 
@@ -50,6 +69,5 @@
     commit 42fb9cfd5b18 ("Documentation: dev-tools: Add link to RV docs")
     1 commits needs resolving in total
 
-待实现的功能
-
-- 文件参数可以是文件夹而不仅仅是单个文件
+遇到无法检查的译文时，脚本会立即停止，并以非零状态退出。它无法判断译文内容是否
+已经完整反映英文原文；仍需人工检查列出的提交以及相应文件。
diff --git a/tools/docs/checktransupdate.py b/tools/docs/checktransupdate.py
index d7b98753e35f..5f2517b59771 100755
--- a/tools/docs/checktransupdate.py
+++ b/tools/docs/checktransupdate.py
@@ -7,6 +7,9 @@ in different locales, e.g., zh_CN. More specially, it uses `git log`
 commit to find the latest english commit from the translation commit
 (order by author date) and the latest english commits from HEAD. If
 differences occur, report the file and commits that need to be updated.
+The English kernel documentation and corresponding translation are
+matched by their relative paths under
+Documentation/ and Documentation/translations/<locale>/, respectively.
 
 The usage is as follows:
 - tools/docs/checktransupdate.py -l zh_CN
@@ -29,26 +32,30 @@ import os
 import re
 import time
 import logging
+import subprocess
+import sys
 from argparse import ArgumentParser, ArgumentTypeError, BooleanOptionalAction
 from datetime import datetime
 
 
 def get_origin_path(file_path):
-    """Get the origin path from the translation path"""
-    paths = file_path.split("/")
-    tidx = paths.index("translations")
-    opaths = paths[:tidx]
-    opaths += paths[tidx + 2 :]
-    return "/".join(opaths)
+    """Map a translated path to the same path under Documentation/."""
+    parts = file_path.split("/")
+    return "/".join([parts[0], *parts[3:]])
 
 
 def get_latest_commit_from(file_path, commit):
     """Get the latest commit from the specified commit for the specified file"""
-    command = f"git log --pretty=format:%H%n%aD%n%cD%n%n%B {commit} -1 -- {file_path}"
-    logging.debug(command)
-    pipe = os.popen(command)
-    result = pipe.read()
-    result = result.split("\n")
+    command = [
+        "git", "log", "--pretty=format:%H%n%aD%n%cD%n%n%B",
+        commit, "-1", "--", file_path,
+    ]
+    logging.debug("%s", command)
+    completed = subprocess.run(command, capture_output=True, text=True, check=False)
+    if completed.returncode:
+        logging.warning("Cannot read Git revision %s: %s", commit, completed.stderr.strip())
+        return None
+    result = completed.stdout.split("\n")
     if len(result) <= 1:
         return None
 
@@ -65,6 +72,11 @@ def get_latest_commit_from(file_path, commit):
 def get_origin_from_trans(origin_path, t_from_head):
     """Get the latest origin commit from the translation commit"""
     o_from_t = get_latest_commit_from(origin_path, t_from_head["hash"])
+    if o_from_t is None:
+        # The translation can enter the history on a different branch before
+        # the English source is merged. Search the current source history by
+        # author date in that case, using the same heuristic as below.
+        o_from_t = get_latest_commit_from(origin_path, "HEAD")
     while o_from_t is not None and o_from_t["author_date"] > t_from_head["author_date"]:
         o_from_t = get_latest_commit_from(origin_path, o_from_t["hash"] + "^")
     if o_from_t is not None:
@@ -128,20 +140,20 @@ def valid_commit(commit):
     msg = pretty_output(commit)
     return "Merge tag" not in msg
 
+
 def check_per_file(file_path):
     """Check the translation status for the specified file"""
     opath = get_origin_path(file_path)
-
     if not os.path.isfile(opath):
         logging.error("Cannot find the origin path for %s", file_path)
-        return
+        return False
 
     o_from_head = get_latest_commit_from(opath, "HEAD")
     t_from_head = get_latest_commit_from(file_path, "HEAD")
 
     if o_from_head is None or t_from_head is None:
         logging.error("Cannot find the latest commit for %s", file_path)
-        return
+        return False
 
     o_from_t = get_origin_from_trans_smartly(opath, t_from_head)
     # notice, o_from_t from get_*_smartly() is always more accurate than from get_*()
@@ -150,7 +162,7 @@ def check_per_file(file_path):
 
     if o_from_t is None:
         logging.error("Error: Cannot find the latest origin commit for %s", file_path)
-        return
+        return False
 
     if o_from_head["hash"] == o_from_t["hash"]:
         logging.debug("No update needed for %s", file_path)
@@ -165,14 +177,17 @@ def check_per_file(file_path):
                 logging.info("commit %s", pretty_output(commit))
                 count += 1
         logging.info("%d commits needs resolving in total\n", count)
+    return True
 
 
 def valid_locales(locale):
     """Check if the locale is valid or not"""
     script_path = os.path.dirname(os.path.abspath(__file__))
     linux_path = os.path.join(script_path, "../..")
-    if not os.path.isdir(f"{linux_path}/Documentation/translations/{locale}"):
-        raise ArgumentTypeError("Invalid locale: {locale}")
+    if locale not in os.listdir(f"{linux_path}/Documentation/translations") or not os.path.isdir(
+        f"{linux_path}/Documentation/translations/{locale}"
+    ):
+        raise ArgumentTypeError(f"Invalid locale: {locale}")
     return locale
 
 
@@ -270,31 +285,24 @@ def main():
 
     # Configure logging based on the --log argument
     log_level = getattr(logging, args.log.upper(), logging.INFO)
-    config_logging(log_level)
+    config_logging(log_level, args.logfile)
 
     # Get files related to linux path
     files = args.files
     if len(files) == 0:
-        offical_files = list_files_with_excluding_folders(
+        official_files = list_files_with_excluding_folders(
             os.path.join(linux_path, "Documentation"), ["translations", "output"], "rst"
         )
-
-        for file in offical_files:
-            # split the path into parts
-            path_parts = file.split(os.sep)
-            # find the index of the "Documentation" directory
-            kindex = path_parts.index("Documentation")
-            # insert the translations and locale after the Documentation directory
-            new_path_parts = path_parts[:kindex + 1] + ["translations", args.locale] \
-                           + path_parts[kindex + 1 :]
-            # join the path parts back together
-            new_file = os.sep.join(new_path_parts)
-            if os.path.isfile(new_file):
-                files.append(new_file)
-            else:
-                if args.print_missing_translations:
-                    logging.info(os.path.relpath(os.path.abspath(file), linux_path))
-                    logging.info("No translation in the locale of %s\n", args.locale)
+        for file in official_files:
+            relative = os.path.relpath(file, os.path.join(linux_path, "Documentation"))
+            translated = os.path.join(
+                linux_path, "Documentation", "translations", args.locale, relative
+            )
+            if os.path.isfile(translated):
+                files.append(translated)
+            elif args.print_missing_translations:
+                logging.info(os.path.relpath(file, linux_path))
+                logging.info("No translation in the locale of %s\n", args.locale)
     else:
         # check if the files are directories or files
         new_files = []
@@ -312,7 +320,8 @@ def main():
     os.chdir(linux_path)
 
     for file in files:
-        check_per_file(file)
+        if not check_per_file(file):
+            sys.exit(1)
 
 
 if __name__ == "__main__":
-- 
2.51.0

